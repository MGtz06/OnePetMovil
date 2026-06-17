import '/flutter_flow/flutter_flow_util.dart';
import '/propietario/menu_propietario/menu_propietario_widget.dart';
import '/index.dart';
import 'mascotas_widget.dart' show MascotasWidget;
import 'package:flutter/material.dart';

class MascotasModel extends FlutterFlowModel<MascotasWidget> {
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
