import '/flutter_flow/flutter_flow_util.dart';
import '/propietario/menu_propietario/menu_propietario_widget.dart';
import 'expediente_mascota_widget.dart' show ExpedienteMascotaWidget;
import 'package:flutter/material.dart';

class ExpedienteMascotaModel extends FlutterFlowModel<ExpedienteMascotaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for menuPropietario component.
  late MenuPropietarioModel menuPropietarioModel;

  @override
  void initState(BuildContext context) {
    menuPropietarioModel = createModel(context, () => MenuPropietarioModel());
  }

  @override
  void dispose() {
    menuPropietarioModel.dispose();
  }
}
