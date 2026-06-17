import '/flutter_flow/flutter_flow_util.dart';
import '/propietario/menu_propietario/menu_propietario_widget.dart';
import 'mapa_screen_widget.dart' show MapaScreenWidget;
import 'package:flutter/material.dart';

class MapaScreenModel extends FlutterFlowModel<MapaScreenWidget> {
  ///  Local state fields for this page.

  double? latHospital = 32.4873155;

  double? longHospita = -116.9345324;

  double? latActual;

  double? longActual;

  bool? tieneUbicacion;

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
