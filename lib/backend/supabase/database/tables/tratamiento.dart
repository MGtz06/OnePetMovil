import '../database.dart';

class TratamientoTable extends SupabaseTable<TratamientoRow> {
  @override
  String get tableName => 'tratamiento';

  @override
  TratamientoRow createRow(Map<String, dynamic> data) => TratamientoRow(data);
}

class TratamientoRow extends SupabaseDataRow {
  TratamientoRow(super.data);

  @override
  SupabaseTable get table => TratamientoTable();

  int get receta => getField<int>('receta')!;
  set receta(int value) => setField<int>('receta', value);

  int? get cantidad => getField<int>('cantidad');
  set cantidad(int? value) => setField<int>('cantidad', value);

  String get medicamento => getField<String>('medicamento')!;
  set medicamento(String value) => setField<String>('medicamento', value);

  String get notas => getField<String>('notas')!;
  set notas(String value) => setField<String>('notas', value);

  String get dosis => getField<String>('dosis')!;
  set dosis(String value) => setField<String>('dosis', value);

  String get frecuencia => getField<String>('frecuencia')!;
  set frecuencia(String value) => setField<String>('frecuencia', value);

  String get duracion => getField<String>('duracion')!;
  set duracion(String value) => setField<String>('duracion', value);

  String get mascota => getField<String>('mascota')!;
  set mascota(String value) => setField<String>('mascota', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);
}
