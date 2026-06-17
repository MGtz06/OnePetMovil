import '../database.dart';

class RecetaTable extends SupabaseTable<RecetaRow> {
  @override
  String get tableName => 'receta';

  @override
  RecetaRow createRow(Map<String, dynamic> data) => RecetaRow(data);
}

class RecetaRow extends SupabaseDataRow {
  RecetaRow(super.data);

  @override
  SupabaseTable get table => RecetaTable();

  int get numero => getField<int>('numero')!;
  set numero(int value) => setField<int>('numero', value);

  DateTime get fecha => getField<DateTime>('fecha')!;
  set fecha(DateTime value) => setField<DateTime>('fecha', value);

  String get instrugenerales => getField<String>('instrugenerales')!;
  set instrugenerales(String value) =>
      setField<String>('instrugenerales', value);

  int? get hospitalizacion => getField<int>('hospitalizacion');
  set hospitalizacion(int? value) => setField<int>('hospitalizacion', value);

  int? get consulta => getField<int>('consulta');
  set consulta(int? value) => setField<int>('consulta', value);
}
