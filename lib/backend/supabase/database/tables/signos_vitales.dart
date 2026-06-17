import '../database.dart';

class SignosVitalesTable extends SupabaseTable<SignosVitalesRow> {
  @override
  String get tableName => 'signos_vitales';

  @override
  SignosVitalesRow createRow(Map<String, dynamic> data) =>
      SignosVitalesRow(data);
}

class SignosVitalesRow extends SupabaseDataRow {
  SignosVitalesRow(super.data);

  @override
  SupabaseTable get table => SignosVitalesTable();

  int get numero => getField<int>('numero')!;
  set numero(int value) => setField<int>('numero', value);

  DateTime get fecha => getField<DateTime>('fecha')!;
  set fecha(DateTime value) => setField<DateTime>('fecha', value);

  int get freccardiaca => getField<int>('freccardiaca')!;
  set freccardiaca(int value) => setField<int>('freccardiaca', value);

  int get frecrespiratoria => getField<int>('frecrespiratoria')!;
  set frecrespiratoria(int value) => setField<int>('frecrespiratoria', value);

  double get temperatura => getField<double>('temperatura')!;
  set temperatura(double value) => setField<double>('temperatura', value);

  int get hospitalizacion => getField<int>('hospitalizacion')!;
  set hospitalizacion(int value) => setField<int>('hospitalizacion', value);
}
