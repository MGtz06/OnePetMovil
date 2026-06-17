import '../database.dart';

class HospitalizacionTable extends SupabaseTable<HospitalizacionRow> {
  @override
  String get tableName => 'hospitalizacion';

  @override
  HospitalizacionRow createRow(Map<String, dynamic> data) =>
      HospitalizacionRow(data);
}

class HospitalizacionRow extends SupabaseDataRow {
  HospitalizacionRow(super.data);

  @override
  SupabaseTable get table => HospitalizacionTable();

  int get numero => getField<int>('numero')!;
  set numero(int value) => setField<int>('numero', value);

  String get diagnoingreso => getField<String>('diagnoingreso')!;
  set diagnoingreso(String value) => setField<String>('diagnoingreso', value);

  DateTime get fechaingreso => getField<DateTime>('fechaingreso')!;
  set fechaingreso(DateTime value) => setField<DateTime>('fechaingreso', value);

  PostgresTime get horaingreso => getField<PostgresTime>('horaingreso')!;
  set horaingreso(PostgresTime value) =>
      setField<PostgresTime>('horaingreso', value);

  String get obsergenerales => getField<String>('obsergenerales')!;
  set obsergenerales(String value) => setField<String>('obsergenerales', value);

  DateTime? get fechaalta => getField<DateTime>('fechaalta');
  set fechaalta(DateTime? value) => setField<DateTime>('fechaalta', value);

  PostgresTime? get horaalta => getField<PostgresTime>('horaalta');
  set horaalta(PostgresTime? value) =>
      setField<PostgresTime>('horaalta', value);

  double get total => getField<double>('total')!;
  set total(double value) => setField<double>('total', value);

  int get consulta => getField<int>('consulta')!;
  set consulta(int value) => setField<int>('consulta', value);

  String get estado => getField<String>('estado')!;
  set estado(String value) => setField<String>('estado', value);

  String get veterinario => getField<String>('veterinario')!;
  set veterinario(String value) => setField<String>('veterinario', value);

  String get expediente => getField<String>('expediente')!;
  set expediente(String value) => setField<String>('expediente', value);
}
