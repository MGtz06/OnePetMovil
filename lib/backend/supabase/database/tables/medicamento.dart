import '../database.dart';

class MedicamentoTable extends SupabaseTable<MedicamentoRow> {
  @override
  String get tableName => 'medicamento';

  @override
  MedicamentoRow createRow(Map<String, dynamic> data) => MedicamentoRow(data);
}

class MedicamentoRow extends SupabaseDataRow {
  MedicamentoRow(super.data);

  @override
  SupabaseTable get table => MedicamentoTable();

  String get clave => getField<String>('clave')!;
  set clave(String value) => setField<String>('clave', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);

  String get descripcion => getField<String>('descripcion')!;
  set descripcion(String value) => setField<String>('descripcion', value);

  double get precio => getField<double>('precio')!;
  set precio(double value) => setField<double>('precio', value);
}
