import '/flutter_flow/flutter_flow_util.dart';
import '/propietario/menu_propietario/menu_propietario_widget.dart';
import 'perfil_p_widget.dart' show PerfilPWidget;
import 'package:flutter/material.dart';

class PerfilPModel extends FlutterFlowModel<PerfilPWidget> {
  ///  State fields for stateful widgets in this page.
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile = FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';
  // Model for menuPropietario component.
  late MenuPropietarioModel menuPropietarioModel;
  // State field(s) for folioperfil widget.
  FocusNode? folioperfilFocusNode;
  TextEditingController? folioperfilTextController;
  String? Function(BuildContext, String?)? folioperfilTextControllerValidator;

  @override
  void initState(BuildContext context) {
    menuPropietarioModel = createModel(context, () => MenuPropietarioModel());
  }

  @override
  void dispose() {
    menuPropietarioModel.dispose();
    folioperfilFocusNode?.dispose();
    folioperfilTextController?.dispose();
  }
}
