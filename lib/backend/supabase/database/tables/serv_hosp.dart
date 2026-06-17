import '../database.dart';

class ServHospTable extends SupabaseTable<ServHospRow> {
  @override
  String get tableName => 'serv_hosp';

  @override
  ServHospRow createRow(Map<String, dynamic> data) => ServHospRow(data);
}

class ServHospRow extends SupabaseDataRow {
  ServHospRow(super.data);

  @override
  SupabaseTable get table => ServHospTable();

  String get servicio => getField<String>('servicio')!;
  set servicio(String value) => setField<String>('servicio', value);

  int get hospitalizacion => getField<int>('hospitalizacion')!;
  set hospitalizacion(int value) => setField<int>('hospitalizacion', value);

  int get cantidad => getField<int>('cantidad')!;
  set cantidad(int value) => setField<int>('cantidad', value);

  double get subtotal => getField<double>('subtotal')!;
  set subtotal(double value) => setField<double>('subtotal', value);
}
