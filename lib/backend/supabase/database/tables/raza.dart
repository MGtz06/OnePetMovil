import '../database.dart';

class RazaTable extends SupabaseTable<RazaRow> {
  @override
  String get tableName => 'raza';

  @override
  RazaRow createRow(Map<String, dynamic> data) => RazaRow(data);
}

class RazaRow extends SupabaseDataRow {
  RazaRow(super.data);

  @override
  SupabaseTable get table => RazaTable();

  String get clave => getField<String>('clave')!;
  set clave(String value) => setField<String>('clave', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);

  String get especie => getField<String>('especie')!;
  set especie(String value) => setField<String>('especie', value);
}
