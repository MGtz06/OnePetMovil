import '../database.dart';

class TelefonoTable extends SupabaseTable<TelefonoRow> {
  @override
  String get tableName => 'telefono';

  @override
  TelefonoRow createRow(Map<String, dynamic> data) => TelefonoRow(data);
}

class TelefonoRow extends SupabaseDataRow {
  TelefonoRow(super.data);

  @override
  SupabaseTable get table => TelefonoTable();

  int get clave => getField<int>('clave')!;
  set clave(int value) => setField<int>('clave', value);

  String get numprincipal => getField<String>('numprincipal')!;
  set numprincipal(String value) => setField<String>('numprincipal', value);

  String? get numsecundario => getField<String>('numsecundario');
  set numsecundario(String? value) => setField<String>('numsecundario', value);

  String get propietario => getField<String>('propietario')!;
  set propietario(String value) => setField<String>('propietario', value);
}
