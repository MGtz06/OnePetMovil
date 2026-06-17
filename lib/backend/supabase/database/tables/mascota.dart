import '../database.dart';

class MascotaTable extends SupabaseTable<MascotaRow> {
  @override
  String get tableName => 'mascota';

  @override
  MascotaRow createRow(Map<String, dynamic> data) => MascotaRow(data);
}

class MascotaRow extends SupabaseDataRow {
  MascotaRow(super.data);

  @override
  SupabaseTable get table => MascotaTable();

  String get folio => getField<String>('folio')!;
  set folio(String value) => setField<String>('folio', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);

  String get sexo => getField<String>('sexo')!;
  set sexo(String value) => setField<String>('sexo', value);

  DateTime get fechanacimiento => getField<DateTime>('fechanacimiento')!;
  set fechanacimiento(DateTime value) =>
      setField<DateTime>('fechanacimiento', value);

  double get peso => getField<double>('peso')!;
  set peso(double value) => setField<double>('peso', value);

  String get color => getField<String>('color')!;
  set color(String value) => setField<String>('color', value);

  String? get alergias => getField<String>('alergias');
  set alergias(String? value) => setField<String>('alergias', value);

  String get caracunica => getField<String>('caracunica')!;
  set caracunica(String value) => setField<String>('caracunica', value);

  String get propietario => getField<String>('propietario')!;
  set propietario(String value) => setField<String>('propietario', value);

  String get especie => getField<String>('especie')!;
  set especie(String value) => setField<String>('especie', value);

  String get raza => getField<String>('raza')!;
  set raza(String value) => setField<String>('raza', value);

  String get estado => getField<String>('estado')!;
  set estado(String value) => setField<String>('estado', value);

  String? get imagen => getField<String>('imagen');
  set imagen(String? value) => setField<String>('imagen', value);
}
