import '../database.dart';

class EdoCitaTable extends SupabaseTable<EdoCitaRow> {
  @override
  String get tableName => 'edo_cita';

  @override
  EdoCitaRow createRow(Map<String, dynamic> data) => EdoCitaRow(data);
}

class EdoCitaRow extends SupabaseDataRow {
  EdoCitaRow(super.data);

  @override
  SupabaseTable get table => EdoCitaTable();

  String get clave => getField<String>('clave')!;
  set clave(String value) => setField<String>('clave', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);
}
