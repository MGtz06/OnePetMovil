import '../database.dart';

class EspecialidadTable extends SupabaseTable<EspecialidadRow> {
  @override
  String get tableName => 'especialidad';

  @override
  EspecialidadRow createRow(Map<String, dynamic> data) => EspecialidadRow(data);
}

class EspecialidadRow extends SupabaseDataRow {
  EspecialidadRow(super.data);

  @override
  SupabaseTable get table => EspecialidadTable();

  String get clave => getField<String>('clave')!;
  set clave(String value) => setField<String>('clave', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);

  String get descripcion => getField<String>('descripcion')!;
  set descripcion(String value) => setField<String>('descripcion', value);
}
