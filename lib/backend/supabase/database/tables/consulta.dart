import '../database.dart';

class ConsultaTable extends SupabaseTable<ConsultaRow> {
  @override
  String get tableName => 'consulta';

  @override
  ConsultaRow createRow(Map<String, dynamic> data) => ConsultaRow(data);
}

class ConsultaRow extends SupabaseDataRow {
  ConsultaRow(super.data);

  @override
  SupabaseTable get table => ConsultaTable();

  int get numero => getField<int>('numero')!;
  set numero(int value) => setField<int>('numero', value);

  String get sintomas => getField<String>('sintomas')!;
  set sintomas(String value) => setField<String>('sintomas', value);

  int get freccardiaca => getField<int>('freccardiaca')!;
  set freccardiaca(int value) => setField<int>('freccardiaca', value);

  int get frecrespiratoria => getField<int>('frecrespiratoria')!;
  set frecrespiratoria(int value) => setField<int>('frecrespiratoria', value);

  double get temperatura => getField<double>('temperatura')!;
  set temperatura(double value) => setField<double>('temperatura', value);

  String get observaciones => getField<String>('observaciones')!;
  set observaciones(String value) => setField<String>('observaciones', value);

  String get diagnostico => getField<String>('diagnostico')!;
  set diagnostico(String value) => setField<String>('diagnostico', value);

  double get total => getField<double>('total')!;
  set total(double value) => setField<double>('total', value);

  String get cita => getField<String>('cita')!;
  set cita(String value) => setField<String>('cita', value);

  String get expediente => getField<String>('expediente')!;
  set expediente(String value) => setField<String>('expediente', value);
}
