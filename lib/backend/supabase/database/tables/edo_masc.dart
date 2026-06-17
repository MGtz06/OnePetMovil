import '../database.dart';

class EdoMascTable extends SupabaseTable<EdoMascRow> {
  @override
  String get tableName => 'edo_masc';

  @override
  EdoMascRow createRow(Map<String, dynamic> data) => EdoMascRow(data);
}

class EdoMascRow extends SupabaseDataRow {
  EdoMascRow(super.data);

  @override
  SupabaseTable get table => EdoMascTable();

  String get clave => getField<String>('clave')!;
  set clave(String value) => setField<String>('clave', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);
}
