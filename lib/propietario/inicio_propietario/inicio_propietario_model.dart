import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/propietario/menu_propietario/menu_propietario_widget.dart';
import '/index.dart';
import 'inicio_propietario_widget.dart' show InicioPropietarioWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class InicioPropietarioModel extends FlutterFlowModel<InicioPropietarioWidget> {
  ///  Local state fields for this page.

  List<String> mascotasList = [];
  void addToMascotasList(String item) => mascotasList.add(item);
  void removeFromMascotasList(String item) => mascotasList.remove(item);
  void removeAtIndexFromMascotasList(int index) => mascotasList.removeAt(index);
  void insertAtIndexInMascotasList(int index, String item) =>
      mascotasList.insert(index, item);
  void updateMascotasListAtIndex(int index, Function(String) updateFn) =>
      mascotasList[index] = updateFn(mascotasList[index]);

  int duracionReceta = 0;

  List<int> tratamientosAct = [];
  void addToTratamientosAct(int item) => tratamientosAct.add(item);
  void removeFromTratamientosAct(int item) => tratamientosAct.remove(item);
  void removeAtIndexFromTratamientosAct(int index) =>
      tratamientosAct.removeAt(index);
  void insertAtIndexInTratamientosAct(int index, int item) =>
      tratamientosAct.insert(index, item);
  void updateTratamientosActAtIndex(int index, Function(int) updateFn) =>
      tratamientosAct[index] = updateFn(tratamientosAct[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in InicioPropietario widget.
  List<MascotaRow>? mascotasU;
  List<CitaRow>? citasNuevas;
  // Model for menuPropietario component.
  late MenuPropietarioModel menuPropietarioModel;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {
    menuPropietarioModel = createModel(context, () => MenuPropietarioModel());
  }

  @override
  void dispose() {
    menuPropietarioModel.dispose();
  }
}
