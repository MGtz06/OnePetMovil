import '../database.dart';

class PagoTable extends SupabaseTable<PagoRow> {
  @override
  String get tableName => 'pago';

  @override
  PagoRow createRow(Map<String, dynamic> data) => PagoRow(data);
}

class PagoRow extends SupabaseDataRow {
  PagoRow(super.data);

  @override
  SupabaseTable get table => PagoTable();

  int get codigo => getField<int>('codigo')!;
  set codigo(int value) => setField<int>('codigo', value);

  DateTime get fecha => getField<DateTime>('fecha')!;
  set fecha(DateTime value) => setField<DateTime>('fecha', value);

  PostgresTime get hora => getField<PostgresTime>('hora')!;
  set hora(PostgresTime value) => setField<PostgresTime>('hora', value);

  double get pagofinal => getField<double>('pagofinal')!;
  set pagofinal(double value) => setField<double>('pagofinal', value);

  int get consulta => getField<int>('consulta')!;
  set consulta(int value) => setField<int>('consulta', value);

  int? get hospitalizacion => getField<int>('hospitalizacion');
  set hospitalizacion(int? value) => setField<int>('hospitalizacion', value);
}
