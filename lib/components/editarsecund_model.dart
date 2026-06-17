import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editarsecund_widget.dart' show EditarsecundWidget;
import 'package:flutter/material.dart';

class EditarsecundModel extends FlutterFlowModel<EditarsecundWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for telefonoprin widget.
  FocusNode? telefonoprinFocusNode;
  TextEditingController? telefonoprinTextController;
  String? Function(BuildContext, String?)? telefonoprinTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Registrar widget.
  List<TelefonoRow>? existenciaTel;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    telefonoprinFocusNode?.dispose();
    telefonoprinTextController?.dispose();
  }
}
