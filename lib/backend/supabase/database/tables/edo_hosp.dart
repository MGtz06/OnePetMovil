import '../database.dart';

class EdoHospTable extends SupabaseTable<EdoHospRow> {
  @override
  String get tableName => 'edo_hosp';

  @override
  EdoHospRow createRow(Map<String, dynamic> data) => EdoHospRow(data);
}

class EdoHospRow extends SupabaseDataRow {
  EdoHospRow(super.data);

  @override
  SupabaseTable get table => EdoHospTable();

  String get clave => getField<String>('clave')!;
  set clave(String value) => setField<String>('clave', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);
}
