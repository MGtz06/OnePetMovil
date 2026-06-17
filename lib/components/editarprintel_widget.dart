import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editarprintel_model.dart';
export 'editarprintel_model.dart';

class EditarprintelWidget extends StatefulWidget {
  const EditarprintelWidget({super.key});

  @override
  State<EditarprintelWidget> createState() => _EditarprintelWidgetState();
}

class _EditarprintelWidgetState extends State<EditarprintelWidget> {
  late EditarprintelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarprintelModel());

    _model.telefonoseconTextController ??= TextEditingController();
    _model.telefonoseconFocusNode ??= FocusNode();

    // Removido el valor '_' inicial para que el usuario pueda escribir libremente
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
      child: Container(
        width: double.infinity, // Ajustado para ser responsivo
        height: 450.0, // Aumentado ligeramente para evitar desbordamiento
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x25090F13),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Barra superior de arrastre estética
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Container(
                        width: 60.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                  ],
                ),
                // Título y botón de regreso
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () async => context.safePop(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/angulo-circulo-izquierda.png',
                            width: 30.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ' Editar Telefono Principal',
                          style: FlutterFlowTheme.of(context).headlineSmall.override(
                                font: GoogleFonts.manrope(fontWeight: FontWeight.bold),
                                color: Colors.black,
                                fontSize: 22.0, // Ajustado para evitar desborde
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Sección de información
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.infoCircle,
                        color: Color(0xFF4B5563),
                        size: 18.0,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Por favor, ingresa la información requerida.',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.manrope(fontWeight: FontWeight.w500),
                                fontSize: 14.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 30.0,
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Text(
                  'Nuevo número telefónico principal*',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.manrope(),
                        fontSize: 15.0,
                      ),
                ),
                // Contenedor del Input
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: TextFormField(
                      controller: _model.telefonoseconTextController,
                      focusNode: _model.telefonoseconFocusNode,
                      autofocus: true,
                      enabled: true, // AHORA HABILITADO
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Ej. 1234567890',
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                      ),
                      keyboardType: TextInputType.phone,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator: _model.telefonoseconTextControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                // Botón Registrar
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 20.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        // Lógica de validación y guardado
                        if (functions.validarTelefono(_model.telefonoseconTextController.text)) {
                          FFAppState().telefonoValidado = functions.formatoTelefono(_model.telefonoseconTextController.text)!;
                          
                          _model.existenciaTel = await TelefonoTable().queryRows(
                            queryFn: (q) => q.or("numprincipal.eq.${FFAppState().telefonoValidado}, numsecundario.eq.${FFAppState().telefonoValidado}"),
                          );

                          if (_model.existenciaTel?.isEmpty ?? true) {
                            await TelefonoTable().update(
                              data: {'numprincipal': FFAppState().telefonoValidado},
                              matchingRows: (rows) => rows.eqOrNull('propietario', FFAppState().folioUsuario),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Guardado correctamente')),
                            );
                            Navigator.pop(context);
                          } else {
                            await showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text('Error'),
                                content: const Text('El número ya está registrado'),
                                actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Ok'))],
                              ),
                            );
                          }
                        } else {
                          await showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Número inválido'),
                              actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Ok'))],
                            ),
                          );
                        }
                      },
                      text: 'Registrar',
                      options: FFButtonOptions(
                        width: 250.0,
                        height: 50.0,
                        color: const Color(0xFF51ABD1),
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                              font: GoogleFonts.manrope(),
                              color: Colors.white,
                            ),
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}