import '../database.dart';

class CitaTable extends SupabaseTable<CitaRow> {
  @override
  String get tableName => 'cita';

  @override
  CitaRow createRow(Map<String, dynamic> data) => CitaRow(data);
}

class CitaRow extends SupabaseDataRow {
  CitaRow(super.data);

  @override
  SupabaseTable get table => CitaTable();

  String get folio => getField<String>('folio')!;
  set folio(String value) => setField<String>('folio', value);

  DateTime get fecha => getField<DateTime>('fecha')!;
  set fecha(DateTime value) => setField<DateTime>('fecha', value);

  PostgresTime get hora => getField<PostgresTime>('hora')!;
  set hora(PostgresTime value) => setField<PostgresTime>('hora', value);

  String get motivo => getField<String>('motivo')!;
  set motivo(String value) => setField<String>('motivo', value);

  String get propietario => getField<String>('propietario')!;
  set propietario(String value) => setField<String>('propietario', value);

  String get mascota => getField<String>('mascota')!;
  set mascota(String value) => setField<String>('mascota', value);

  String get veterinario => getField<String>('veterinario')!;
  set veterinario(String value) => setField<String>('veterinario', value);

  String get estado => getField<String>('estado')!;
  set estado(String value) => setField<String>('estado', value);
}
