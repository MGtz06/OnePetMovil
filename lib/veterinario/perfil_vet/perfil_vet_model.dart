import '/flutter_flow/flutter_flow_util.dart';
import '/veterinario/menu_veterinario/menu_veterinario_widget.dart';
import 'perfil_vet_widget.dart' show PerfilVetWidget;
import 'package:flutter/material.dart';

class PerfilVetModel extends FlutterFlowModel<PerfilVetWidget> {
  ///  State fields for stateful widgets in this page.
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile = FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';
  // State field(s) for folioperfil widget.
  FocusNode? folioperfilFocusNode;
  TextEditingController? folioperfilTextController;
  String? Function(BuildContext, String?)? folioperfilTextControllerValidator;
  // Model for menuVeterinario component.
  late MenuVeterinarioModel menuVeterinarioModel;

  @override
  void initState(BuildContext context) {
    menuVeterinarioModel = createModel(context, () => MenuVeterinarioModel());
  }

  @override
  void dispose() {
    folioperfilFocusNode?.dispose();
    folioperfilTextController?.dispose();

    menuVeterinarioModel.dispose();
  }
}
