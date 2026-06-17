import '/backend/supabase/supabase.dart';
import '/components/exit_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/veterinario/menu_veterinario/menu_veterinario_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; 
import 'package:supabase_flutter/supabase_flutter.dart' as supa; 
import 'package:provider/provider.dart';
import 'perfil_vet_model.dart';
export 'perfil_vet_model.dart';

class PerfilVetWidget extends StatefulWidget {
  const PerfilVetWidget({super.key});

  static String routeName = 'perfilVet';
  static String routePath = '/perfilVet';

  @override
  State<PerfilVetWidget> createState() => _PerfilVetWidgetState();
}

class _PerfilVetWidgetState extends State<PerfilVetWidget> {
  late PerfilVetModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ImagePicker _picker = ImagePicker(); 

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilVetModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // --- LÓGICA DE SUBIDA A SUPABASE (MANTENIDA) ---
  Future<void> _gestionarFoto(ImageSource fuente) async {
    final XFile? image = await _picker.pickImage(source: fuente, imageQuality: 80);
    if (image == null) return;

    setState(() => _model.isDataUploading = true);

    try {
      final bytes = await image.readAsBytes();
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final path = 'veterinario/$fileName'; 

      await supa.Supabase.instance.client.storage
          .from('Images')
          .uploadBinary(path, bytes, fileOptions: const supa.FileOptions(contentType: 'image/jpeg'));

      final String publicUrl = supa.Supabase.instance.client.storage
          .from('Images')
          .getPublicUrl(path);

      await UsuarioTable().update(
        data: {'imagen': publicUrl},
        matchingRows: (rows) => rows.eq('usuario', FFAppState().folioUsuario),
      );

      setState(() {}); 
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() => _model.isDataUploading = false);
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
              onTap: () { Navigator.pop(context); _gestionarFoto(ImageSource.gallery); },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Cámara'),
              onTap: () { Navigator.pop(context); _gestionarFoto(ImageSource.camera); },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<UsuarioRow>>(
      future: UsuarioTable().querySingleRow(
        queryFn: (q) => q.eqOrNull('usuario', FFAppState().folioUsuario),
      ),
      builder: (context, userSnapshot) {
        final userRow = userSnapshot.data?.firstOrNull;

        return FutureBuilder<List<VeterinarioRow>>(
          future: VeterinarioTable().querySingleRow(
            queryFn: (q) => q.eqOrNull('folio', FFAppState().folioUsuario),
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData || _model.isDataUploading) {
              return const Scaffold(
                backgroundColor: Colors.white,
                body: Center(child: CircularProgressIndicator()),
              );
            }
            final perfilVetVeterinarioRow = snapshot.data!.first;

            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: Colors.white,
                drawer: Drawer(
                  elevation: 16.0,
                  child: wrapWithModel(
                    model: _model.menuVeterinarioModel,
                    updateCallback: () => setState(() {}),
                    child: const MenuVeterinarioWidget(),
                  ),
                ),
                appBar: AppBar(
                  backgroundColor: const Color(0xFF3B8EB7),
                  title: Text('Mi perfil', style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Manrope', color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600,
                  )),
                  centerTitle: true, elevation: 0.0,
                ),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // --- FOTO DE PERFIL CON LÁPIZ DE EDICIÓN ---
                          SizedBox(
                            height: 125.0,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Container(
                                    width: 112.38, height: 112.38,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).accent2,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: FlutterFlowTheme.of(context).secondary, width: 2.0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(60.0),
                                            child: (userRow?.imagen != null && userRow!.imagen!.isNotEmpty)
                                                ? CachedNetworkImage(
                                                    imageUrl: userRow.imagen!,
                                                    width: 100.0, height: 100.0, fit: BoxFit.cover,
                                                  )
                                                : Image.asset(
                                                    'assets/images/iconoUsuario.png',
                                                    width: 100.0, height: 100.0, fit: BoxFit.cover,
                                                  ),
                                          ),
                                        ),
                                        // ICONO DE LÁPIZ RESTAURADO
                                        Align(
                                          alignment: const AlignmentDirectional(1.1, 1.1),
                                          child: InkWell(
                                            onTap: _mostrarOpcionesFoto,
                                            child: const Icon(Icons.edit, color: Color(0xFF3D7AAC), size: 30.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          Text('Dr. ${perfilVetVeterinarioRow.nombrepila} ${perfilVetVeterinarioRow.primerapellido}',
                              style: FlutterFlowTheme.of(context).headlineLarge),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F4F8),
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(color: const Color(0xFFE5E7EB)),
                            ),
                            child: Text(perfilVetVeterinarioRow.folio ?? '', style: const TextStyle(color: Colors.grey)),
                          ),
                          const SizedBox(height: 25),

                          // --- INFO ESTÁTICA (SIN BOTONES DE EDICIÓN PARA CORREO/TEL) ---
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: const Color(0xFFE5E7EB)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  _infoStaticRow('Correo:', perfilVetVeterinarioRow.correo ?? 'No disponible'),
                                  const Divider(height: 24),
                                  _infoStaticRow('Teléfono:', perfilVetVeterinarioRow.telefono ?? 'No disponible'),
                                  const Divider(height: 24),
                                  FutureBuilder<List<EspecialidadRow>>(
                                    future: EspecialidadTable().querySingleRow(
                                      queryFn: (q) => q.eqOrNull('clave', perfilVetVeterinarioRow.especialidad),
                                    ),
                                    builder: (context, espSnap) {
                                      final esp = espSnap.data?.firstOrNull;
                                      return _infoStaticRow('Especialidad:', esp?.nombre ?? 'General');
                                    },
                                  ),
                                  const Divider(height: 24),
                                  _infoStaticRow('Cédula:', perfilVetVeterinarioRow.cedula ?? 'N/A'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),

                          _footerBtn(context, 'Cerrar sesión', Icons.logout_rounded, const ExitWidget()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _infoStaticRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)),
        ),
        Expanded(
          child: Text(value, style: const TextStyle(fontSize: 15, color: Color(0xFF57636C))),
        ),
      ],
    );
  }

  Widget _footerBtn(BuildContext context, String title, IconData icon, Widget modal) {
    return InkWell(
      onTap: () async {
        await showModalBottomSheet(isScrollControlled: true, backgroundColor: Colors.transparent, context: context, builder: (context) => modal);
      },
      child: Container(
        width: double.infinity, height: 55,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F4F8),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Icon(icon, color: const Color(0xFFE21C3D), size: 24.0),
              const SizedBox(width: 12),
              Text(title, style: const TextStyle(color: Color(0xFFE21C3D), fontWeight: FontWeight.bold)),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 16.0, color: Color(0xFFE21C3D)),
            ],
          ),
        ),
      ),
    );
  }
}