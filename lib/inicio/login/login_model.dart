import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for foliologin widget.
  FocusNode? foliologinFocusNode;
  TextEditingController? foliologinTextController;
  String? Function(BuildContext, String?)? foliologinTextControllerValidator;
  // State field(s) for contra widget.
  FocusNode? contraFocusNode;
  TextEditingController? contraTextController;
  late bool contraVisibility;
  String? Function(BuildContext, String?)? contraTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in iniciarSesion widget.
  List<UsuarioRow>? user;

  @override
  void initState(BuildContext context) {
    contraVisibility = false;
  }

  @override
  void dispose() {
    foliologinFocusNode?.dispose();
    foliologinTextController?.dispose();

    contraFocusNode?.dispose();
    contraTextController?.dispose();
  }
}
