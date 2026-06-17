import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/veterinario/menu_veterinario/menu_veterinario_widget.dart';
import '/index.dart';
import 'expedientes_widget.dart' show ExpedientesWidget;
import 'package:flutter/material.dart';

class ExpedientesModel extends FlutterFlowModel<ExpedientesWidget> {
  ///  Local state fields for this page.

  String? busqueda;

  String? razaSelect;

  String? especieSelect;

  ///  State fields for stateful widgets in this page.

  // State field(s) for veterinario widget.
  FocusNode? veterinarioFocusNode;
  TextEditingController? veterinarioTextController;
  String? Function(BuildContext, String?)? veterinarioTextControllerValidator;
  // State field(s) for Mascota widget.
  String? mascotaValue1;
  FormFieldController<String>? mascotaValueController1;
  // State field(s) for Mascota widget.
  String? mascotaValue2;
  FormFieldController<String>? mascotaValueController2;
  //Stream<List<MascotaRow>>? expedientesMascotasSupabaseStream;
  // Model for menuVeterinario component.
  late MenuVeterinarioModel menuVeterinarioModel;

  @override
  void initState(BuildContext context) {
    menuVeterinarioModel = createModel(context, () => MenuVeterinarioModel());
  }

  @override
  void dispose() {
    veterinarioFocusNode?.dispose();
    veterinarioTextController?.dispose();

    menuVeterinarioModel.dispose();
  }
}
