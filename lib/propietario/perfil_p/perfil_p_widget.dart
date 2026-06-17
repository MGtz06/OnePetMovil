import '/backend/supabase/supabase.dart';
import '/components/editarcorreo_widget.dart';
import '/components/editarprintel_widget.dart';
import '/components/editarsecund_widget.dart';
import '/components/exit_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/propietario/llamar/llamar_widget.dart';
import '/propietario/menu_propietario/menu_propietario_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;
import 'package:provider/provider.dart';
import 'perfil_p_model.dart';
export 'perfil_p_model.dart';

class PerfilPWidget extends StatefulWidget {
  const PerfilPWidget({super.key});

  static String routeName = 'perfilP';
  static String routePath = '/perfilP';

  @override
  State<PerfilPWidget> createState() => _PerfilPWidgetState();
}

class _PerfilPWidgetState extends State<PerfilPWidget> {
  late PerfilPModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilPModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // Lógica para gestionar la cámara/galería y subir a Supabase
  Future<void> _gestionarFoto(ImageSource fuente) async {
    final XFile? image = await _picker.pickImage(source: fuente, imageQuality: 80);
    if (image == null) return;

    setState(() => _model.isDataUploading = true);

    try {
      final bytes = await image.readAsBytes();
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final path = 'propietario/$fileName'; // Carpeta de destino

      // 1. Subir al Bucket 'Images' (ajustado a tu dirección de Supabase)
      await supa.Supabase.instance.client.storage
          .from('Images')
          .uploadBinary(
            path, 
            bytes, 
            fileOptions: const supa.FileOptions(contentType: 'image/jpeg')
          );

      // 2. Obtener la URL pública
      final String publicUrl = supa.Supabase.instance.client.storage
          .from('Images')
          .getPublicUrl(path);

      // 3. Actualizar la tabla 'usuario' en la columna 'imagen'
      await UsuarioTable().update(
        data: {'imagen': publicUrl},
        matchingRows: (rows) => rows.eq('usuario', FFAppState().folioUsuario),
      );

      setState(() {}); // Refrescar UI
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Foto de perfil actualizada')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al subir imagen: $e')),
      );
    } finally {
      setState(() => _model.isDataUploading = false);
    }
  }

  void _mostrarOpciones() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library, color: Color(0xFF3B8EB7)),
              title: const Text('Elegir de Galería'),
              onTap: () { Navigator.pop(context); _gestionarFoto(ImageSource.gallery); },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Color(0xFF3B8EB7)),
              title: const Text('Tomar Foto'),
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.menuPropietarioModel,
            updateCallback: () => setState(() {}),
            child: const MenuPropietarioWidget(),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: const Color(0xFF3B8EB7),
            automaticallyImplyLeading: true,
            title: Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 110.0, 0.0),
                child: Text(
                  'Mi perfil',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<UsuarioRow>>(
            // Consulta a la tabla usuario usando el folio del AppState
            future: UsuarioTable().querySingleRow(
              queryFn: (q) => q.eqOrNull('usuario', FFAppState().folioUsuario),
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData || _model.isDataUploading) {
                return const Center(child: CircularProgressIndicator());
              }
              final userRow = snapshot.data!.first;

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // --- SECCIÓN DE FOTO: DISEÑO ORIGINAL PRESERVADO ---
                    SizedBox(
                      width: double.infinity,
                      height: 125.0,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-0.16, 0.57),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 16.0),
                              child: Container(
                                width: 112.4,
                                height: 112.4,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent2,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).secondary,
                                    width: 2.0,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50.0),
                                        // Imagen desde Base de Datos o Asset por defecto
                                        child: (userRow.imagen != null && userRow.imagen!.isNotEmpty)
                                            ? CachedNetworkImage(
                                                imageUrl: userRow.imagen!,
                                                width: 100.0,
                                                height: 100.0,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.asset(
                                                'assets/images/iconoUsuario.png',
                                                width: 100.0,
                                                height: 100.0,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(1.23, 1.17),
                                      child: InkWell(
                                        onTap: _mostrarOpciones,
                                        child: const Icon(
                                          Icons.edit,
                                          color: Color(0xFF3D7AAC),
                                          size: 30.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // --- CARGA DE DATOS DEL PROPIETARIO ---
                    FutureBuilder<List<PropietarioRow>>(
                      future: PropietarioTable().querySingleRow(
                        queryFn: (q) => q.eqOrNull('folio', FFAppState().folioUsuario),
                      ),
                      builder: (context, propSnap) {
                        final prop = propSnap.data?.isNotEmpty == true ? propSnap.data!.first : null;
                        return Column(
                          children: [
                            Text(
                              '${prop?.nombrepila ?? ''} ${prop?.primerapellido ?? ''}',
                              style: FlutterFlowTheme.of(context).headlineLarge,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                height: 35.0,
                                decoration: BoxDecoration(
                                  color: const Color(0x80FFFFFF),
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(color: const Color(0xFFE5E7EB)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text(prop?.folio ?? '')],
                                ),
                              ),
                            ),
                            // Card de Datos (Diseño Original)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(color: const Color(0x68817878)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _infoRow(context, 'Correo: ', prop?.correo ?? '', const EditarcorreoWidget()),
                                      const Divider(height: 20.0),
                                      FutureBuilder<List<TelefonoRow>>(
                                        future: TelefonoTable().querySingleRow(
                                          queryFn: (q) => q.eqOrNull('propietario', FFAppState().folioUsuario),
                                        ),
                                        builder: (context, telSnap) {
                                          final tel = telSnap.data?.isNotEmpty == true ? telSnap.data!.first : null;
                                          return Column(
                                            children: [
                                              _infoRow(context, 'Tel. Principal: ', tel?.numprincipal ?? '', const EditarprintelWidget()),
                                              const Divider(height: 20.0),
                                              _infoRow(context, 'Tel. Secundario: ', tel?.numsecundario ?? '', const EditarsecundWidget()),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    
                    // --- BOTONES INFERIORES ---
                    _footerBtn(context, 'Contáctanos', Icons.chat_bubble_outline, const LlamarWidget()),
                    _footerBtn(context, 'Cerrar Sesión', Icons.logout, const ExitWidget(), isRed: true),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Widget para las filas de información (Correo, Teléfonos)
  Widget _infoRow(BuildContext context, String label, String value, Widget modal) {
    return Row(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Expanded(child: Text(value)),
        InkWell(
          onTap: () => _abrirModal(modal),
          child: Image.asset('assets/images/lapiz.png', width: 15.0),
        ),
      ],
    );
  }

  // Widget para los botones grandes de contacto y cierre de sesión
  Widget _footerBtn(BuildContext context, String title, IconData icon, Widget modal, {bool isRed = false}) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
      child: InkWell(
        onTap: () => _abrirModal(modal),
        child: Container(
          width: double.infinity,
          height: 60.0,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F4F8), 
            borderRadius: BorderRadius.circular(12.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(icon, color: isRed ? Colors.red : const Color(0xFF3B8EB7), size: 24.0),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Text(title, style: TextStyle(color: isRed ? Colors.red : Colors.black)),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, size: 18.0, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _abrirModal(Widget widget) async {
    await showModalBottomSheet(
      isScrollControlled: true, 
      backgroundColor: Colors.transparent, 
      context: context, 
      builder: (context) => widget
    );
    setState(() {}); // Actualizar tras cerrar el modal
  }
}