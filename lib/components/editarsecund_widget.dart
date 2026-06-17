import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'editarsecund_model.dart';
export 'editarsecund_model.dart';

class EditarsecundWidget extends StatefulWidget {
  const EditarsecundWidget({super.key});

  @override
  State<EditarsecundWidget> createState() => _EditarsecundWidgetState();
}

class _EditarsecundWidgetState extends State<EditarsecundWidget> {
  late EditarsecundModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarsecundModel());

    _model.telefonoprinTextController ??= TextEditingController();
    _model.telefonoprinFocusNode ??= FocusNode();

    // Limpiamos el campo al iniciar para que no tenga el '_' que estorbaba
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.telefonoprinTextController?.clear();
        }));
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
        width: MediaQuery.sizeOf(context).width,
        height: 450.0, // Ajuste de altura para mejor comodidad
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
                // Barra superior estética
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
                // Título con botón de regreso
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
                            width: 29.1,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Editar Telefono secundario',
                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                              fontFamily: 'Manrope',
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                // Icono info e instrucción
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.infoCircle,
                        color: Color(0xFF4B5563),
                        size: 20.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 0.0),
                      child: Text(
                        'Por favor, ingresa la informacion requerida.',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 27.0,
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                // Label del campo
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 7.0),
                  child: Text(
                    '    Nuevo numero telefonico secundario*',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                // Contenedor del Input (Corregido: Enabled true)
                Container(
                  width: double.infinity,
                  height: 62.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: const Color(0xFFE5E7EB), width: 1.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: TextFormField(
                      controller: _model.telefonoprinTextController,
                      focusNode: _model.telefonoprinFocusNode,
                      enabled: true, // <--- AHORA SÍ PUEDES ESCRIBIR
                      autofocus: true,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Ej: 1234567890',
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
                // Botón de Registrar con Lógica Mejorada
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 20.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final telText = _model.telefonoprinTextController.text;

                        // 1. Validar usando tu custom function
                        if (functions.validarTelefono(telText)) {
                          
                          // Limpiamos el número para la base de datos (solo dígitos)
                          String soloNumeros = telText.replaceAll(RegExp(r'[^0-9]'), '');
                          
                          // 2. Formatear para el AppState (usando tu función de forma segura)
                          FFAppState().telefonoValidado = functions.formatoTelefono(telText) ?? soloNumeros;
                          
                          // 3. Consultar si ya existe en Supabase
                          _model.existenciaTel = await TelefonoTable().queryRows(
                            queryFn: (q) => q.or(
                                "numprincipal.eq.$soloNumeros, numsecundario.eq.$soloNumeros"),
                          );

                          if (_model.existenciaTel?.isEmpty ?? true) {
                            // 4. Si no existe, actualizar
                            await TelefonoTable().update(
                              data: { 'numsecundario': soloNumeros },
                              matchingRows: (rows) => rows.eq(
                                'propietario',
                                FFAppState().folioUsuario,
                              ),
                            );
                            
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Guardado correctamente')),
                            );
                            Navigator.pop(context);
                          } else {
                            _mostrarError(context, 'El numero ya esta registrado');
                          }
                        } else {
                          _mostrarError(context, 'Numero invalido (debe ser de 10 digitos)');
                        }
                        safeSetState(() {});
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

  // Función interna para mostrar alertas sin repetir código
  void _mostrarError(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (alertContext) => AlertDialog(
        title: const Text('Atención'),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(alertContext),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}