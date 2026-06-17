import '/backend/supabase/supabase.dart';
import '/components/l_istavacia_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/propietario/menu_propietario/menu_propietario_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart'; 
import 'package:supabase_flutter/supabase_flutter.dart' as supa; 

import 'expediente_mascota_model.dart';
export 'expediente_mascota_model.dart';

class ExpedienteMascotaWidget extends StatefulWidget {
  const ExpedienteMascotaWidget({super.key});

  static String routeName = 'ExpedienteMascota';
  static String routePath = '/expedienteMascota';

  @override
  State<ExpedienteMascotaWidget> createState() =>
      _ExpedienteMascotaWidgetState();
}

class _ExpedienteMascotaWidgetState extends State<ExpedienteMascotaWidget> {
  late ExpedienteMascotaModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExpedienteMascotaModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // --- ACTUALIZACIÓN DE FOTO ---
  Future<void> _cambiarFotoMascota(ImageSource fuente) async {
    final XFile? image = await _picker.pickImage(source: fuente, imageQuality: 80);
    if (image == null) return;

    setState(() => _isUploading = true);
    try {
      final bytes = await image.readAsBytes();
      final fileName = 'pet_${FFAppState().folioMascota}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final path = 'mascotas/$fileName'; 

      await supa.Supabase.instance.client.storage
          .from('Images')
          .uploadBinary(path, bytes, fileOptions: const supa.FileOptions(contentType: 'image/jpeg'));

      final String publicUrl = supa.Supabase.instance.client.storage
          .from('Images')
          .getPublicUrl(path);

      await MascotaTable().update(
        data: {'imagen': publicUrl},
        matchingRows: (rows) => rows.eq('folio', FFAppState().folioMascota),
      );
      setState(() {}); 
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() => _isUploading = false);
    }
  }

  void _mostrarOpcionesFoto() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Galería'),
              onTap: () { Navigator.pop(context); _cambiarFotoMascota(ImageSource.gallery); },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Cámara'),
              onTap: () { Navigator.pop(context); _cambiarFotoMascota(ImageSource.camera); },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF7FBFD),
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.menuPropietarioModel,
            updateCallback: () => setState(() {}),
            child: const MenuPropietarioWidget(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3B8EB7),
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            'Expediente',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Manrope',
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: _isUploading 
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
              child: Column(
                children: [
                  // --- PERFIL MASCOTA ---
                  FutureBuilder<List<MascotaRow>>(
                    future: MascotaTable().querySingleRow(
                      queryFn: (q) => q.eqOrNull('folio', FFAppState().folioMascota),
                    ),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final mascota = snapshot.data!.first;

                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: const Color(0xFFE0E3E7)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    alignment: const AlignmentDirectional(1.2, 1.2),
                                    children: [
                                      Container(
                                        width: 85.0, height: 85.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(shape: BoxShape.circle),
                                        child: Image.network(
                                          mascota.imagen ?? '',
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) => 
                                              Image.asset('assets/images/pata_(6).png', fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        width: 32, height: 32,
                                        decoration: const BoxDecoration(color: Color(0xFF3B8EB7), shape: BoxShape.circle),
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: const Icon(Icons.edit_square, color: Colors.white, size: 16),
                                          onPressed: _mostrarOpcionesFoto, 
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            mascota.nombre ?? '',
                                            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                                          ),
                                          _buildBadgeRow(mascota),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(height: 30, thickness: 1.0, color: Color(0xFFE0E3E7)),
                              _buildPetDetailsGrid(mascota),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Historial Clínico', style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),

                  _buildSectionHeader('Consultas', 'assets/images/pata.png'),
                  _buildConsultasList(),

                  const SizedBox(height: 20),

                  _buildSectionHeader('Hospitalizaciones', 'assets/images/hospital.png'),
                  _buildHospitalizacionesList(),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- CONSULTAS ---
  Widget _buildConsultasList() {
    return FutureBuilder<List<ConsultaRow>>(
      future: ConsultaTable().queryRows(queryFn: (q) => q.eqOrNull('expediente', FFAppState().folioMascota)),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) return const LIstavaciaWidget();
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final consulta = snapshot.data![index];
            return FutureBuilder<List<CitaRow>>(
              future: CitaTable().querySingleRow(queryFn: (q) => q.eqOrNull('folio', consulta.cita)),
              builder: (context, citaSnap) {
                final cita = citaSnap.data?.firstOrNull;
                return FutureBuilder<List<VeterinarioRow>>(
                  future: VeterinarioTable().querySingleRow(queryFn: (q) => q.eqOrNull('folio', cita?.veterinario)),
                  builder: (context, vetSnap) {
                    final v = vetSnap.data?.firstOrNull;
                    return _card(
                      date: cita?.fecha,
                      status: 'Finalizada',
                      t1: 'Motivo:', c1: consulta.sintomas,
                      t2: 'Diagnóstico:', c2: consulta.diagnostico,
                      t3: 'Signos:', c3: 'T: ${consulta.temperatura}°C | FC: ${consulta.freccardiaca} | FR: ${consulta.frecrespiratoria}',
                      t4: 'Observaciones:', c4: consulta.observaciones,
                      t5: 'Veterinario:', c5: '${v?.nombrepila ?? ''} ${v?.primerapellido ?? ''}',
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  // --- HOSPITALIZACIONES CON FECHAS ---
  Widget _buildHospitalizacionesList() {
    return FutureBuilder<List<HospitalizacionRow>>(
      future: HospitalizacionTable().queryRows(queryFn: (q) => q.eqOrNull('expediente', FFAppState().folioMascota)),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) return const LIstavaciaWidget();
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final hosp = snapshot.data![index];
            return FutureBuilder<List<VeterinarioRow>>(
              future: VeterinarioTable().querySingleRow(queryFn: (q) => q.eqOrNull('folio', hosp.veterinario)),
              builder: (context, vetSnap) {
                final v = vetSnap.data?.firstOrNull;
                
                String estadoDb = (hosp.estado ?? '').toString().trim().toUpperCase();
                String estadoTexto;
                Color estadoColor;

                switch (estadoDb) {
                  case 'HOS':
                    estadoTexto = 'Hospitalizado';
                    estadoColor = const Color(0xFFE68A00);
                    break;
                  case 'ALT':
                    estadoTexto = 'Alta Médica';
                    estadoColor = const Color(0xFF2E7D32);
                    break;
                  case 'PAG':
                    estadoTexto = 'Pagado';
                    estadoColor = const Color(0xFF3B8EB7);
                    break;
                  default:
                    estadoTexto = 'En Proceso';
                    estadoColor = Colors.grey;
                }

                // Formateo de fechas para mostrar periodo
                String fechaEntrada = dateTimeFormat("yMMMd", hosp.fechaingreso);
                String fechaSalida = hosp.fechaalta != null ? dateTimeFormat("yMMMd", hosp.fechaalta!) : (hosp.estado == 'HOS' ? 'Pendiente' : 'S/F');

                return _card(
                  color: const Color(0xFFEFF6FA),
                  date: hosp.fechaingreso,
                  status: estadoTexto,
                  statusColor: estadoColor,
                  t1: 'Diagnóstico:', c1: hosp.diagnoingreso,
                  t2: 'Periodo:', c2: '$fechaEntrada — $fechaSalida',
                  t3: 'Evolución:', c3: hosp.obsergenerales,
                  t4: 'Veterinario:', c4: '${v?.nombrepila ?? ''} ${v?.primerapellido ?? ''}',
                );
              },
            );
          },
        );
      },
    );
  }

  // --- WIDGET CARD ---
  Widget _card({
    DateTime? date, 
    required String status, 
    Color statusColor = const Color(0xFF3B8EB7),
    required String t1, String? c1, 
    required String t2, String? c2, 
    String? t3, String? c3,
    String? t4, String? c4,
    String? t5, String? c5,
    Color color = const Color(0xFFCFEBFA)
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color, 
        borderRadius: BorderRadius.circular(15), 
        border: Border.all(color: const Color(0xFFE0E3E7))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _badge(date != null ? dateTimeFormat("yMMMd", date) : 'S/F'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: statusColor, width: 1.5),
                ),
                child: Text(
                  status.toUpperCase(),
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: statusColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _textDetail(t1, c1),
          const SizedBox(height: 6),
          _textDetail(t2, c2),
          if (c3 != null) ...[const SizedBox(height: 6), _textDetail(t3!, c3)],
          if (c4 != null) ...[const SizedBox(height: 6), _textDetail(t4!, c4)],
          if (c5 != null) ...[const SizedBox(height: 6), _textDetail(t5!, c5)],
        ],
      ),
    );
  }

  // --- UI COMPONENTS ---
  Widget _buildPetDetailsGrid(MascotaRow mascota) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildDynamicText('Especie:', mascota.especie, EspecieTable())),
            Expanded(child: _textDetail('Sexo:', mascota.sexo)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: _textDetail('Peso:', '${mascota.peso ?? '0'} kg')),
            Expanded(child: _textDetail('Color:', mascota.color)),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, String assetPath) {
    return Container(
      width: double.infinity, height: 55,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E3E7)),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Image.asset(assetPath, width: 28, height: 28, fit: BoxFit.contain,
              errorBuilder: (context, error, stack) => const Icon(Icons.pets, color: Color(0xFF3B8EB7))),
          ),
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildBadgeRow(MascotaRow mascota) {
    return FutureBuilder<List<RazaRow>>(
      future: RazaTable().querySingleRow(queryFn: (q) => q.eqOrNull('clave', mascota.raza)),
      builder: (context, snapshot) {
        final raza = snapshot.data?.firstOrNull?.nombre ?? '...';
        return Row(
          children: [
            _badge(raza),
            const SizedBox(width: 8),
            _badge('${functions.calcularEdad(mascota.fechanacimiento)} años'),
          ],
        );
      },
    );
  }

  Widget _badge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: const Color(0xFFC4E3F3), borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF3B8EB7))),
    );
  }

  Widget _buildDynamicText(String label, String? id, SupabaseTable table) {
    return FutureBuilder<List<dynamic>>(
      future: id != null ? table.querySingleRow(queryFn: (q) => q.eqOrNull('clave', id)) : Future.value([]),
      builder: (context, snapshot) {
        final nombre = snapshot.data?.firstOrNull?.nombre ?? '...';
        return _textDetail(label, nombre);
      },
    );
  }

  Widget _textDetail(String label, String? value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: '$label ', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 13)),
          TextSpan(text: value ?? 'N/A', style: const TextStyle(color: Color(0xFF57636C), fontSize: 13)),
        ],
      ),
    );
  }
}