import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editarprintel_widget.dart' show EditarprintelWidget;
import 'package:flutter/material.dart';

class EditarprintelModel extends FlutterFlowModel<EditarprintelWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for telefonosecon widget.
  FocusNode? telefonoseconFocusNode;
  TextEditingController? telefonoseconTextController;
  String? Function(BuildContext, String?)? telefonoseconTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Registrar widget.
  List<TelefonoRow>? existenciaTel;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    telefonoseconFocusNode?.dispose();
    telefonoseconTextController?.dispose();
  }
}
