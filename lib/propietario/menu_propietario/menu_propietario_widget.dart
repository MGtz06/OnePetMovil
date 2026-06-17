import '/components/exit_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/propietario/llamar/llamar_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_propietario_model.dart';
export 'menu_propietario_model.dart';

class MenuPropietarioWidget extends StatefulWidget {
  const MenuPropietarioWidget({super.key});

  @override
  State<MenuPropietarioWidget> createState() => _MenuPropietarioWidgetState();
}

class _MenuPropietarioWidgetState extends State<MenuPropietarioWidget> {
  late MenuPropietarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuPropietarioModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  // Función para determinar el color de fondo dinámicamente
  Color _obtenerColorActivo(String modulo) {
    return FFAppState().ModuloActual == modulo
        ? const Color(0xFFE4F8FC)
        : Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 284.07,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Opacity(
        opacity: 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // --- LOGO ---
            Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 35.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/logote.png',
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // --- BOTÓN INICIO ---
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: InkWell(
                onTap: () async {
                  setState(() { FFAppState().ModuloActual = 'modInicio'; });
                  context.pushNamed(InicioPropietarioWidget.routeName);
                },
                child: Container(
                  width: 262.77,
                  height: 43.4,
                  decoration: BoxDecoration(
                    color: _obtenerColorActivo('modInicio'),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Image.asset('assets/images/hogar.png', width: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Text('Inicio', style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.manrope(fontWeight: FontWeight.w600),
                          fontSize: 17.0,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // --- BOTÓN MI PERFIL ---
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: InkWell(
                onTap: () async {
                  setState(() { FFAppState().ModuloActual = 'modPerfil'; });
                  context.pushNamed(PerfilPWidget.routeName);
                },
                child: Container(
                  width: 267.9,
                  height: 43.4,
                  decoration: BoxDecoration(
                    color: _obtenerColorActivo('modPerfil'),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Image.asset('assets/images/usuario_(3).png', width: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Text('Mi perfil', style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.manrope(fontWeight: FontWeight.w600),
                          fontSize: 17.0,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // --- BOTÓN MIS MASCOTAS ---
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: InkWell(
                onTap: () async {
                  setState(() { FFAppState().ModuloActual = 'modMascotas'; });
                  context.pushNamed(MascotasWidget.routeName);
                },
                child: Container(
                  width: 263.04,
                  height: 44.6,
                  decoration: BoxDecoration(
                    color: _obtenerColorActivo('modMascotas'),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Image.asset('assets/images/pata_(6).png', width: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Text('Mis mascotas', style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.manrope(fontWeight: FontWeight.w600),
                          fontSize: 17.0,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // --- BOTÓN CITAS ---
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: InkWell(
                onTap: () async {
                  setState(() { FFAppState().ModuloActual = 'modCitas'; });
                  context.pushNamed(CalendarioPropietarioWidget.routeName);
                },
                child: Container(
                  width: 262.8,
                  height: 45.8,
                  decoration: BoxDecoration(
                    color: _obtenerColorActivo('modCitas'),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Image.asset('assets/images/calendario_(1).png', width: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Text('Citas', style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.manrope(fontWeight: FontWeight.w600),
                          fontSize: 17.0,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // --- BOTÓN CONTACTANOS ---
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: InkWell(
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (dialogContext) => const Dialog(
                      backgroundColor: Colors.transparent,
                      child: LlamarWidget(),
                    ),
                  );
                },
                child: Container(
                  width: 264.2,
                  height: 43.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Image.asset('assets/images/auriculares.png', width: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Text('Contactanos', style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.manrope(fontWeight: FontWeight.w600),
                          fontSize: 17.0,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // --- SECCIÓN INFERIOR: SALIR ---
            const Spacer(),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
              child: InkWell(
                onTap: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: const Color(0x175D5C5C),
                    context: context,
                    builder: (context) => const ExitWidget(),
                  );
                },
                child: SizedBox(
                  width: 279.4,
                  height: 34.86,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
                        child: Text(
                          'Salir',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Google Fonts',
                            color: const Color(0xFF413D3D),
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Image.asset('assets/images/salir-alternativa.png', height: 25.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
