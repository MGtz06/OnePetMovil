import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editarcorreo_widget.dart' show EditarcorreoWidget;
import 'package:flutter/material.dart';

class EditarcorreoModel extends FlutterFlowModel<EditarcorreoWidget> {
  ///  Local state fields for this component.

  String? correoFormateado;

  ///  State fields for stateful widgets in this component.

  // State field(s) for correo widget.
  FocusNode? correoFocusNode;
  TextEditingController? correoTextController;
  String? Function(BuildContext, String?)? correoTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Registrar widget.
  List<PropietarioRow>? existenciacorreo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    correoFocusNode?.dispose();
    correoTextController?.dispose();
  }
}

