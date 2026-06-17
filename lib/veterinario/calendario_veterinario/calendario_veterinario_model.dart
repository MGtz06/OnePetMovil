import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/veterinario/menu_veterinario/menu_veterinario_widget.dart';
import 'calendario_veterinario_widget.dart' show CalendarioVeterinarioWidget;
import 'package:flutter/material.dart';

class CalendarioVeterinarioModel
    extends FlutterFlowModel<CalendarioVeterinarioWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay1;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay2;
  // Model for menuVeterinario component.
  late MenuVeterinarioModel menuVeterinarioModel;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay1 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calendarSelectedDay2 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    menuVeterinarioModel = createModel(context, () => MenuVeterinarioModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    menuVeterinarioModel.dispose();
  }
}
