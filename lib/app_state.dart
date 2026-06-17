import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  // --- LÓGICA PARA CARGAR DATOS AL INICIAR LA APP ---
  late SharedPreferences prefs;

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    
    // Leemos del disco y asignamos a las variables privadas
    _isLoggedIn = prefs.getBool('ff_isLoggedIn') ?? false;
    _userTipo = prefs.getString('ff_userTipo') ?? '';
    _folioUsuario = prefs.getString('ff_folioUsuario') ?? '';
    _imgPropUrl = prefs.getString('ff_imgPropUrl') ?? '';
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  // --- VARIABLES CON PERSISTENCIA (Siguen llamándose igual) ---

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    prefs.setBool('ff_isLoggedIn', value); // Guarda físicamente
    notifyListeners(); // Actualiza la interfaz
  }

  String _userTipo = '';
  String get userTipo => _userTipo;
  set userTipo(String value) {
    _userTipo = value;
    prefs.setString('ff_userTipo', value);
    notifyListeners();
  }

  String _folioUsuario = '';
  String get folioUsuario => _folioUsuario;
  set folioUsuario(String value) {
    _folioUsuario = value;
    prefs.setString('ff_folioUsuario', value);
    notifyListeners();
  }

  String _imgPropUrl = '';
  String get imgPropUrl => _imgPropUrl;
  set imgPropUrl(String value) {
    _imgPropUrl = value;
    prefs.setString('ff_imgPropUrl', value);
    notifyListeners();
  }

  // --- RESTO DE VARIABLES (Sin cambios en nombres) ---

  String _ModuloActual = 'inicio';
  String get ModuloActual => _ModuloActual;
  set ModuloActual(String value) {
    _ModuloActual = value;
    notifyListeners();
  }

  List<String> _tratamientos = [];
  List<String> get tratamientos => _tratamientos;
  set tratamientos(List<String> value) {
    _tratamientos = value;
    notifyListeners();
  }

  String _folioMascota = '';
  String get folioMascota => _folioMascota;
  set folioMascota(String value) {
    _folioMascota = value;
    notifyListeners();
  }

  String _ImgMascUrl = '';
  String get ImgMascUrl => _ImgMascUrl;
  set ImgMascUrl(String value) {
    _ImgMascUrl = value;
    notifyListeners();
  }

  String _telefonoValidado = '';
  String get telefonoValidado => _telefonoValidado;
  set telefonoValidado(String value) {
    _telefonoValidado = value;
    notifyListeners();
  }

  String _cancelarCitaFolio = '';
  String get cancelarCitaFolio => _cancelarCitaFolio;
  set cancelarCitaFolio(String value) {
    _cancelarCitaFolio = value;
    notifyListeners();
  }

  bool _agendaMostradaHoy = false;

  bool get agendaMostradaHoy => _agendaMostradaHoy;

  void marcarAgendaComoMostrada() {
    _agendaMostradaHoy = true;
    notifyListeners();
  }

  // Métodos de utilidad para la lista de tratamientos
  void addToTratamientos(String value) {
    _tratamientos.add(value);
    notifyListeners();
  }

  void removeFromTratamientos(String value) {
    _tratamientos.remove(value);
    notifyListeners();
  }

  void removeAtIndexInTratamientos(int index) {
    _tratamientos.removeAt(index);
    notifyListeners();
  }

  void updateTratamientosAtIndex(int index, String Function(String) updateFn) {
    _tratamientos[index] = updateFn(_tratamientos[index]);
    notifyListeners();
  }

  void insertAtIndexInTratamientos(int index, String value) {
    _tratamientos.insert(index, value);
    notifyListeners();
  }
}