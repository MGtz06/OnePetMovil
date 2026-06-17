import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/veterinario/menu_veterinario/menu_veterinario_widget.dart';
import '/index.dart';
import 'dart:async';
import 'inicio_veterinario_widget.dart' show InicioVeterinarioWidget;
import 'package:flutter/material.dart';

class InicioVeterinarioModel extends FlutterFlowModel<InicioVeterinarioWidget> {
  ///  State fields for stateful widgets in this page.
  List<CitaRow>? citasHoyVet; 
  List<MascotaRow>? mascotasDataVet;
  // Model for menuVeterinario component.
  late MenuVeterinarioModel menuVeterinarioModel;
  Completer<List<CitaRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {
    menuVeterinarioModel = createModel(context, () => MenuVeterinarioModel());
  }

  @override
  void dispose() {
    menuVeterinarioModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
