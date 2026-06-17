import '../database.dart';

class ExpedienteTable extends SupabaseTable<ExpedienteRow> {
  @override
  String get tableName => 'expediente';

  @override
  ExpedienteRow createRow(Map<String, dynamic> data) => ExpedienteRow(data);
}

class ExpedienteRow extends SupabaseDataRow {
  ExpedienteRow(super.data);

  @override
  SupabaseTable get table => ExpedienteTable();

  String get mascota => getField<String>('mascota')!;
  set mascota(String value) => setField<String>('mascota', value);

  DateTime get fechaapertura => getField<DateTime>('fechaapertura')!;
  set fechaapertura(DateTime value) =>
      setField<DateTime>('fechaapertura', value);
}
