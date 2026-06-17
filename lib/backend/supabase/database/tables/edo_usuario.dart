import '../database.dart';

class EdoUsuarioTable extends SupabaseTable<EdoUsuarioRow> {
  @override
  String get tableName => 'edo_usuario';

  @override
  EdoUsuarioRow createRow(Map<String, dynamic> data) => EdoUsuarioRow(data);
}

class EdoUsuarioRow extends SupabaseDataRow {
  EdoUsuarioRow(super.data);

  @override
  SupabaseTable get table => EdoUsuarioTable();

  String get clave => getField<String>('clave')!;
  set clave(String value) => setField<String>('clave', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);
}
