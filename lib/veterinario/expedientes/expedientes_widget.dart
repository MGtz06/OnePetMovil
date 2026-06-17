import '/backend/supabase/supabase.dart';
import '/components/l_istavacia_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/veterinario/menu_veterinario/menu_veterinario_widget.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'expedientes_model.dart';
export 'expedientes_model.dart';

class ExpedientesWidget extends StatefulWidget {
  const ExpedientesWidget({super.key});

  static String routeName = 'Expedientes';
  static String routePath = '/expedientes';

  @override
  State<ExpedientesWidget> createState() => _ExpedientesWidgetState();
}

class _ExpedientesWidgetState extends State<ExpedientesWidget> {
  late ExpedientesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<List<MascotaRow>>? _mascotasFuture;
  

  Future<List<MascotaRow>> _getMascotas() async {
    var query = SupaFlow.client.from('mascota').select('''
      *,
      especie_ref:especie(nombre),
      raza_ref:raza(nombre)
    ''');

    final busqueda = _model.busqueda;
    if (busqueda != null && busqueda.isNotEmpty) {
      query = query.ilike('folio', '%$busqueda%');
    }

    // Nota: Aquí seguimos filtrando por el ID (la clave), lo cual es correcto.
    final especie = _model.especieSelect;
    if (especie != null && especie.isNotEmpty) {
      query = query.eq('especie', especie);
    }

    final raza = _model.razaSelect;
    if (raza != null && raza.isNotEmpty) {
      query = query.eq('raza', raza);
    }

    final response = await query;
    return (response as List).map((e) => MascotaRow(e)).toList();
  }

  @override
  void initState() {
    super.initState();

    _model = createModel(context, () => ExpedientesModel());

    _model.veterinarioTextController ??= TextEditingController();
    _model.veterinarioFocusNode ??= FocusNode();

    _mascotasFuture = _getMascotas();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,

        drawer: Drawer(
          child: wrapWithModel(
            model: _model.menuVeterinarioModel,
            updateCallback: () => safeSetState(() {}),
            child: const MenuVeterinarioWidget(),
          ),
        ),

        appBar: AppBar(
          backgroundColor: const Color(0xFF3B8EB7),
          title: const Text('Expedientes'),
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [

                //BUSCADOR
               Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [

                    //FOLIO
                    TextFormField(
                      controller: _model.veterinarioTextController,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_search',
                        const Duration(milliseconds: 500),
                        () {
                          setState(() {
                            _model.busqueda = _model.veterinarioTextController.text;
                            _mascotasFuture = _getMascotas();
                          });
                        },
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Buscar folio',
                      ),
                    ),

                    const SizedBox(height: 10),

                    //DROPDOWNS
                    Row(
                      children: [

                        //ESPECIE
                        Expanded(
                          child: FutureBuilder<List<EspecieRow>>(
                            future: EspecieTable().queryRows(
                              queryFn: (q) => q,
                            ),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const SizedBox(
                                  height: 48,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }

                              final especies = snapshot.data!;

                              return DropdownButtonFormField<String>(
                                initialValue: _model.especieSelect,
                                isExpanded: true,
                                decoration: const InputDecoration(hintText: 'Especie'),
                                items: especies.map((e) {
                                  return DropdownMenuItem(
                                    value: e.clave,
                                    child: Text(e.nombre ?? ''),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _model.especieSelect = val;
                                    _mascotasFuture = _getMascotas();
                                  });
                                },
                              );
                            },
                          ),
                        ),

                        const SizedBox(width: 10),

                        //RAZA
                        Expanded(
                          child: FutureBuilder<List<RazaRow>>(
                            future: RazaTable().queryRows(
                              queryFn: (q) => q,
                            ),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const SizedBox(
                                  height: 48,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }

                              final razas = snapshot.data!;

                              return DropdownButtonFormField<String>(
                                initialValue: _model.razaSelect,
                                isExpanded: true,
                                decoration: const InputDecoration(hintText: 'Raza'),
                                items: razas.map((e) {
                                  return DropdownMenuItem(
                                    value: e.clave,
                                    child: Text(e.nombre ?? ''),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _model.razaSelect = val;
                                    _mascotasFuture = _getMascotas();
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

                // 🧹 LIMPIAR
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _model.busqueda = null;
                      _model.razaSelect = null;
                      _model.especieSelect = null;

                      _model.veterinarioTextController?.clear();

                      _mascotasFuture = _getMascotas();
                    });
                  },
                  child: const Text("Limpiar"),
                ),

                //LISTA
                FutureBuilder<List<MascotaRow>>(
                  future: _mascotasFuture,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }

                    final list = snapshot.data!;

                    if (list.isEmpty) {
                      return const LIstavaciaWidget();
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final mascota = list[index];

                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [

                                  //ICONO
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      'assets/images/pata_(10).png',
                                      width: 44,
                                      height: 44,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Row(
                                          children: [
                                            Text(mascota.nombre ?? ''),

                                            const SizedBox(width: 10),

                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFC4E3F3),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                mascota.folio,
                                                style: const TextStyle(fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),

                                        const SizedBox(height: 4),

                                        Text(
                                          "${mascota.data['especie_ref']?['nombre'] ?? 'Sin especie'} , ${mascota.data['raza_ref']?['nombre'] ?? 'Sin raza'}",
                                          style: FlutterFlowTheme.of(context).labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),

                                  InkWell(
                                    onTap: () {
                                      FFAppState().folioMascota = mascota.folio;
                                      context.pushNamed(
                                        ExpedienteMascotaWidget.routeName,
                                      );
                                    },
                                    child: Container(
                                      width: 80,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).accent2,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context).secondary,
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text("Ver"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}