import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'editarcorreo_model.dart';
export 'editarcorreo_model.dart';

class EditarcorreoWidget extends StatefulWidget {
  const EditarcorreoWidget({super.key});

  @override
  State<EditarcorreoWidget> createState() => _EditarcorreoWidgetState();
}

class _EditarcorreoWidgetState extends State<EditarcorreoWidget> {
  late EditarcorreoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarcorreoModel());

    _model.correoTextController ??= TextEditingController();
    _model.correoFocusNode ??= FocusNode();
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
        width: 400.0,
        height: 400.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
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
                // Línea decorativa superior
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 60.0,
                    height: 4.0,
                    margin: const EdgeInsets.only(top: 4.0),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
                // Título y Botón Atrás
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () async => context.safePop(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/angulo-circulo-izquierda.png',
                            width: 29.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        ' Editar Correo',
                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                              fontFamily: 'Manrope',
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                // Texto de ayuda
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.infoCircle, size: 20.0),
                      const SizedBox(width: 10),
                      Text(
                        'Ingresa el nuevo correo para actualizar.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ],
                  ),
                ),
                const Divider(height: 27.0, thickness: 2.0),
                // Campo de entrada
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 7.0),
                  child: Text('    Nuevo Correo*', style: FlutterFlowTheme.of(context).bodyMedium),
                ),
                TextFormField(
                  controller: _model.correoTextController,
                  focusNode: _model.correoFocusNode,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'ejemplo@correo.com',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFE5E7EB), width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: FlutterFlowTheme.of(context).primary, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF1F5F9),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  keyboardType: TextInputType.emailAddress,
                ),
                // Botón Registrar
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 20.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final emailInput = _model.correoTextController.text;

                        // 1. Validar si el correo es correcto
                        if (functions.validarCorreo(emailInput)) {
                          _model.correoFormateado = functions.formatoCorreo(emailInput);

                          // 2. Verificar si el correo ya existe
                          _model.existenciacorreo = await PropietarioTable().queryRows(
                            queryFn: (q) => q.eq('correo', _model.correoFormateado!),
                          );

                          if (_model.existenciacorreo!.isEmpty) {
                            // 3. Guardar cambios
                            await PropietarioTable().update(
                              data: {'correo': _model.correoFormateado},
                              matchingRows: (rows) => rows.eq(
                                'folio',
                                FFAppState().folioUsuario,
                              ),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Correo actualizado exitosamente')),
                            );
                            Navigator.pop(context); // Cierra el componente
                          } else {
                            _alerta(context, 'Error', 'Este correo ya pertenece a otra cuenta.');
                          }
                        } else {
                          _alerta(context, 'Formato inválido', 'Por favor escribe un correo real.');
                        }
                      },
                      text: 'Registrar',
                      options: FFButtonOptions(
                        width: 227.0,
                        height: 45.0,
                        color: const Color(0xFF51ABD1),
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Manrope',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
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

  // Función rápida para alertas
  void _alerta(BuildContext context, String titulo, String mensaje) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(titulo),
        content: Text(mensaje),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Ok')),
        ],
      ),
    );
  }
}
