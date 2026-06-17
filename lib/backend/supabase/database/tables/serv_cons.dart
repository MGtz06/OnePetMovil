import '../database.dart';

class ServConsTable extends SupabaseTable<ServConsRow> {
  @override
  String get tableName => 'serv_cons';

  @override
  ServConsRow createRow(Map<String, dynamic> data) => ServConsRow(data);
}

class ServConsRow extends SupabaseDataRow {
  ServConsRow(super.data);

  @override
  SupabaseTable get table => ServConsTable();

  String get servicio => getField<String>('servicio')!;
  set servicio(String value) => setField<String>('servicio', value);

  int get consulta => getField<int>('consulta')!;
  set consulta(int value) => setField<int>('consulta', value);

  int get cantidad => getField<int>('cantidad')!;
  set cantidad(int value) => setField<int>('cantidad', value);

  double get subtotal => getField<double>('subtotal')!;
  set subtotal(double value) => setField<double>('subtotal', value);
}
