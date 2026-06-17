import '../database.dart';

class UsuarioTable extends SupabaseTable<UsuarioRow> {
  @override
  String get tableName => 'usuario';

  @override
  UsuarioRow createRow(Map<String, dynamic> data) => UsuarioRow(data);
}

class UsuarioRow extends SupabaseDataRow {
  UsuarioRow(super.data);

  @override
  SupabaseTable get table => UsuarioTable();

  int get numero => getField<int>('numero')!;
  set numero(int value) => setField<int>('numero', value);

  String get usuario => getField<String>('usuario')!;
  set usuario(String value) => setField<String>('usuario', value);

  String get contrasena => getField<String>('contrasena')!;
  set contrasena(String value) => setField<String>('contrasena', value);

  String get tipo => getField<String>('tipo')!;
  set tipo(String value) => setField<String>('tipo', value);

  String? get propietario => getField<String>('propietario');
  set propietario(String? value) => setField<String>('propietario', value);

  String? get recepcionista => getField<String>('recepcionista');
  set recepcionista(String? value) => setField<String>('recepcionista', value);

  String? get veterinario => getField<String>('veterinario');
  set veterinario(String? value) => setField<String>('veterinario', value);

  String? get administrador => getField<String>('administrador');
  set administrador(String? value) => setField<String>('administrador', value);

  String? get imagen => getField<String>('imagen');
  set imagen(String? value) => setField<String>('imagen', value);

  String get estado => getField<String>('estado')!;
  set estado(String value) => setField<String>('estado', value);
}
