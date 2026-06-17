
import '/backend/supabase/supabase.dart';

bool estaActivo(
  DateTime fechaReceta,
  String duracionDias,
) {
  // Obtener solo el número de la duración (ej: "7 días" → 7)
  final numero = duracionDias.replaceAll(RegExp(r'[^0-9]'), '');
  final dias = int.tryParse(numero) ?? 0;

  final hoy = DateTime.now();
  final fin = fechaReceta.add(Duration(days: dias));

  return hoy.isBefore(fin);
}

int calcularEdad(DateTime? fechaNacimiento) {
  if (fechaNacimiento == null) {
    return 0;
  }

  final hoy = DateTime.now();
  final nacimiento = fechaNacimiento.toLocal();

  int edad = hoy.year - nacimiento.year;

  if (hoy.month < nacimiento.month ||
      (hoy.month == nacimiento.month && hoy.day < nacimiento.day)) {
    edad--;
  }

  return edad;
}

DateTime inicioMes() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, 1);
}

DateTime finMes() {
  final now = DateTime.now();
  return DateTime(now.year, now.month + 1, 0);
}

DateTime inicioSemana() {
  final now = DateTime.now();
  final inicio = now.subtract(Duration(days: now.weekday - 1));
  return DateTime(inicio.year, inicio.month, inicio.day);
}

DateTime finSemana() {
  final now = DateTime.now();
  final fin = now.add(Duration(days: 7 - now.weekday));
  return DateTime(fin.year, fin.month, fin.day);
}

bool? hayTratAct(
  String duracionTexto,
  DateTime fechaReceta,
) {
  final numero = duracionTexto.replaceAll(RegExp(r'[^0-9]'), '');
  final dias = int.tryParse(numero) ?? 0;

  final hoy = DateTime.now();
  final fin = fechaReceta.add(Duration(days: dias));

  return hoy.isBefore(fin);
}

bool comparetime(
  String horaBuscar,
  List<CitaRow> citas,
) {
  try {
    for (var cita in citas) {
      final hora = cita.hora; // ya es String tipo "HH:mm:ss"

      if (hora == horaBuscar) {
        return true;
      }
    }

    return false;
  } catch (e) {
    return false;
  }
}

String? newCustomFunction(String? hora) {
  if (hora == null || hora.isEmpty) return null;

  final parts = hora.split(':');
  if (parts.length != 2) return null;

  final h = parts[0].padLeft(2, '0');
  final m = parts[1].padLeft(2, '0');

  return "$h:$m:00";
}

String? generarFolio(CitaRow? ultimaCita) {
  try {
    // Si no hay registros
    if (ultimaCita == null) {
      return "C-00001";
    }

    String ultimoFolio = ultimaCita.folio;

    // Quitar "C-"
    String numeroStr = ultimoFolio.replaceAll("C-", "");

    int numero = int.parse(numeroStr);

    int nuevoNumero = numero + 1;

    String nuevoStr = nuevoNumero.toString().padLeft(5, '0');

    return "C-$nuevoStr";
  } catch (e) {
    return "C-00001";
  }
}

String? formatoTelefono(String? input) {
  if (input == null || input.isEmpty) return null;

  String numbers = input.replaceAll(RegExp(r'[^0-9]'), '');

  if (numbers.length != 10) return null;

  return '(${numbers.substring(0, 3)}) ${numbers.substring(3, 6)}-${numbers.substring(6, 10)}';
}

bool validarTelefono(String? input) {
  if (input == null || input.isEmpty) return false;

  String numbers = input.replaceAll(RegExp(r'[^0-9]'), '');
  return numbers.length == 10;
}

bool validarCorreo(String? input) {
  if (input == null || input.isEmpty) return false;

  final email = input.trim();

  final regex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  return regex.hasMatch(email);
}

String? formatoCorreo(String? input) {
  if (input == null || input.isEmpty) return null;

  return input.trim().toLowerCase();
}
