import '../database.dart';

class EspecieTable extends SupabaseTable<EspecieRow> {
  @override
  String get tableName => 'especie';

  @override
  EspecieRow createRow(Map<String, dynamic> data) => EspecieRow(data);
}

class EspecieRow extends SupabaseDataRow {
  EspecieRow(super.data);

  @override
  SupabaseTable get table => EspecieTable();

  String get clave => getField<String>('clave')!;
  set clave(String value) => setField<String>('clave', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);
}
