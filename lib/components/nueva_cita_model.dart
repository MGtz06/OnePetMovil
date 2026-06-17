
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'nueva_cita_widget.dart' show NuevaCitaWidget;
import 'package:flutter/material.dart';


class NuevaCitaModel extends FlutterFlowModel<NuevaCitaWidget> {
  String mascotaSelect = '';
  DateTime? fechaSelect;
  String? hora; // string visible
  PostgresTime? horaSelect; // REAL para Supabase

  String vetAsignado = '';
  String motivo = 'Consulta';

  DateTimeRange? fechaSelectedDay;

  String? mascotaValue;
  FormFieldController<String>? mascotaValueController;

  String? horaValue;
  FormFieldController<String>? horaValueController;

  String? vetValue;
  FormFieldController<String>? vetValueController;

  TextEditingController? motivoTextController;
  FocusNode? motivoFocusNode;

  List<CitaRow>? citasDelDia;
  List<CitaRow>? ultimofolio;
  CitaRow? registroCita;

  @override
  void initState(BuildContext context) {
    fechaSelectedDay = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now(),
    );
    motivoTextController = TextEditingController(text: 'Consulta');
  }

  @override
  void dispose() {
    motivoTextController?.dispose();
    motivoFocusNode?.dispose();
  }
}