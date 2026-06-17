import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'nueva_cita_model.dart';
export 'nueva_cita_model.dart';

class NuevaCitaWidget extends StatefulWidget {
  const NuevaCitaWidget({super.key});

  @override
  State<NuevaCitaWidget> createState() => _NuevaCitaWidgetState();
}

class _NuevaCitaWidgetState extends State<NuevaCitaWidget> {
  late NuevaCitaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NuevaCitaModel());
    _model.motivoTextController ??= TextEditingController(text: 'Consulta');
    _model.motivoFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    // Validación básica de campos vacíos (se mantiene igual)
    bool isValid = _model.mascotaSelect != '' &&
        _model.fechaSelect != null &&
        _model.hora != null &&
        _model.hora != '' &&
        _model.vetAsignado != '';

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra superior estética
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Container(
                      width: 60, height: 4,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => context.safePop(),
                      child: const Icon(Icons.arrow_back_ios_new, size: 24),
                    ),
                    Text(
                      '    Nueva cita',
                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 30, thickness: 2),

              // --- MASCOTA ---
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 7),
                child: Text('Mascota*', style: FlutterFlowTheme.of(context).bodyMedium),
              ),
              FutureBuilder<List<MascotaRow>>(
                future: MascotaTable().queryRows(
                  queryFn: (q) => q.eq('propietario', FFAppState().folioUsuario),
                ),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const LinearProgressIndicator();
                  final mascotas = snapshot.data!;
                  return FlutterFlowDropDown<String>(
                    controller: _model.mascotaValueController ??= FormFieldController<String>(null),
                    hintText: 'Selecciona mascota...',
                    options: mascotas.map((e) => e.folio).toList(),
                    optionLabels: mascotas.map((e) => e.nombre ?? 'S/N').toList(),
                    onChanged: (val) => setState(() => _model.mascotaSelect = val ?? ''),
                    width: double.infinity, height: 50,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    elevation: 2, borderWidth: 1, borderRadius: 10,
                    borderColor: const Color(0xFFE5E7EB), margin: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                    hidesUnderline: true,
                  );
                },
              ),

              // --- CALENDARIO (DISEÑO ORIGINAL SIN MIN_DATE) ---
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 7),
                child: Text('Fecha*', style: FlutterFlowTheme.of(context).bodyMedium),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: FlutterFlowCalendar(
                  color: FlutterFlowTheme.of(context).primary,
                  weekFormat: false,
                  weekStartsMonday: true,
                  initialDate: _model.fechaSelectedDay?.start,
                  onChange: (DateTimeRange? newSelectedDate) {
                    setState(() {
                      _model.fechaSelectedDay = newSelectedDate;
                      _model.fechaSelect = newSelectedDate?.start;
                    });
                  },
                  titleStyle: FlutterFlowTheme.of(context).titleLarge,
                  locale: FFLocalizations.of(context).languageCode,
                ),
              ),

              // --- HORA ---
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 7),
                child: Text('Hora*', style: FlutterFlowTheme.of(context).bodyMedium),
              ),
              FlutterFlowDropDown<String>(
                controller: _model.horaValueController ??= FormFieldController<String>(null),
                hintText: 'Seleccionar hora...',
                options: const ['08:00:00', '09:00:00', '10:00:00', '11:00:00', '12:00:00', '16:00:00', '17:00:00'],
                onChanged: (val) => setState(() => _model.hora = val),
                width: 200, height: 45,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
                elevation: 2, borderWidth: 1, borderRadius: 10,
                borderColor: const Color(0xFFE5E7EB), margin: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                hidesUnderline: true,
              ),

              // --- VETERINARIO ---
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 7),
                child: Text('Veterinario*', style: FlutterFlowTheme.of(context).bodyMedium),
              ),
              FutureBuilder<List<VeterinarioRow>>(
                future: VeterinarioTable().queryRows(
                  queryFn: (q) => q.eq('especialidad', 'SPEC-01'),
                ),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const LinearProgressIndicator();
                  final vete = snapshot.data!;
                  return FlutterFlowDropDown<String>(
                    controller: _model.vetValueController ??= FormFieldController<String>(null),
                    hintText: 'Asignar médico...',
                    options: vete.map((e) => e.folio).toList(),
                    optionLabels: vete.map((e) => '${e.nombrepila ?? ''} ${e.primerapellido ?? ''}'.trim()).toList(),
                    onChanged: (val) => setState(() => _model.vetAsignado = val ?? ''),
                    width: double.infinity, height: 50,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    elevation: 2, borderWidth: 1, borderRadius: 10,
                    borderColor: const Color(0xFFE5E7EB), margin: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                    hidesUnderline: true,
                  );
                },
              ),

              // --- MOTIVO ---
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 7),
                child: Text('Motivo', style: FlutterFlowTheme.of(context).bodyMedium),
              ),
              TextFormField(
                controller: _model.motivoTextController,
                focusNode: _model.motivoFocusNode,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFE5E7EB), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: FlutterFlowTheme.of(context).primary, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),

              // --- BOTÓN REGISTRAR ---
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 40),
                child: Center(
                  child: FFButtonWidget(
                    text: "Registrar cita",
                    onPressed: !isValid
                        ? null // Se deshabilita si faltan campos
                        : () async {
                            // ---------------------------------------------------------
                            // 1. VALIDACIÓN BLINDADA DE FECHA (LÓGICA, NO DISEÑO)
                            // ---------------------------------------------------------
                            final DateTime ahora = DateTime.now();
                            // Definimos el límite: Mañana a las 00:00:00
                            final DateTime limiteManana = DateTime(ahora.year, ahora.month, ahora.day + 1);

                            // Si la fecha seleccionada es ANTES de mañana, detenemos todo.
                            if (_model.fechaSelect!.isBefore(limiteManana)) {
                              await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Fecha no válida"),
                                  content: const Text("Las citas deben programarse con al menos un día de anticipación (a partir de mañana)."),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Entendido"),
                                    ),
                                  ],
                                ),
                              );
                              return; // <--- Súper importante: Detiene la ejecución aquí
                            }
                            // ---------------------------------------------------------
                            // FIN DE LA NUEVA VALIDACIÓN
                            // ---------------------------------------------------------

                            final String fechaSQL = DateFormat('yyyy-MM-dd').format(_model.fechaSelect!);
                            final String horaSQL = (_model.hora ?? '').trim();

                            // 2. VALIDACIÓN DE CONFLICTO
                            final citasExistentes = await CitaTable().queryRows(
                              queryFn: (q) => q
                                  .eq('veterinario', _model.vetAsignado)
                                  .eq('fecha', fechaSQL)
                                  .eq('hora', horaSQL),
                            );

                            if (citasExistentes.isNotEmpty) {
                              await showDialog(
                                context: context,
                                builder: (_) => const AlertDialog(
                                  title: Text("Horario ocupado"),
                                  content: Text("Este veterinario ya tiene una cita asignada en este horario."),
                                ),
                              );
                              return;
                            }

                            // 3. GENERACIÓN DE FOLIO
                            final ultima = await CitaTable().queryRows(
                              queryFn: (q) => q.order('folio', ascending: false).limit(1),
                            );
                            final nuevoFolio = functions.generarFolio(ultima.firstOrNull);

                            // 4. INSERCIÓN
                            try {
                              await CitaTable().insert({
                                'folio': nuevoFolio,
                                'fecha': fechaSQL,
                                'hora': horaSQL,
                                'motivo': _model.motivoTextController.text,
                                'propietario': FFAppState().folioUsuario,
                                'mascota': _model.mascotaSelect,
                                'veterinario': _model.vetAsignado,
                                'estado': 'PEND',
                              });

                              await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Éxito"),
                                  content: Text("Cita registrada correctamente con el folio: $nuevoFolio"),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Aceptar"),
                                    ),
                                  ],
                                ),
                              );
                              
                              context.safePop();
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Error al guardar: $e')),
                              );
                            }
                          },
                    options: FFButtonOptions(
                      width: 280, height: 50,
                      color: const Color(0xFF51ABD1),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Manrope', color: Colors.white,
                          ),
                      elevation: 2, borderRadius: BorderRadius.circular(30),
                      disabledColor: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}