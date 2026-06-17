import '../database.dart';

class TipoUsuarioTable extends SupabaseTable<TipoUsuarioRow> {
  @override
  String get tableName => 'tipo_usuario';

  @override
  TipoUsuarioRow createRow(Map<String, dynamic> data) => TipoUsuarioRow(data);
}

class TipoUsuarioRow extends SupabaseDataRow {
  TipoUsuarioRow(super.data);

  @override
  SupabaseTable get table => TipoUsuarioTable();

  String get codigo => getField<String>('codigo')!;
  set codigo(String value) => setField<String>('codigo', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);
}
