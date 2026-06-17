import '../database.dart';

class ServicioTable extends SupabaseTable<ServicioRow> {
  @override
  String get tableName => 'servicio';

  @override
  ServicioRow createRow(Map<String, dynamic> data) => ServicioRow(data);
}

class ServicioRow extends SupabaseDataRow {
  ServicioRow(super.data);

  @override
  SupabaseTable get table => ServicioTable();

  String get clave => getField<String>('clave')!;
  set clave(String value) => setField<String>('clave', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);

  String get descripcion => getField<String>('descripcion')!;
  set descripcion(String value) => setField<String>('descripcion', value);

  double get costo => getField<double>('costo')!;
  set costo(double value) => setField<double>('costo', value);
}
