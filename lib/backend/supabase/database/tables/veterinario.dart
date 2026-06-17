import '../database.dart';

class VeterinarioTable extends SupabaseTable<VeterinarioRow> {
  @override
  String get tableName => 'veterinario';

  @override
  VeterinarioRow createRow(Map<String, dynamic> data) => VeterinarioRow(data);
}

class VeterinarioRow extends SupabaseDataRow {
  VeterinarioRow(super.data);

  @override
  SupabaseTable get table => VeterinarioTable();

  String get folio => getField<String>('folio')!;
  set folio(String value) => setField<String>('folio', value);

  String get nombrepila => getField<String>('nombrepila')!;
  set nombrepila(String value) => setField<String>('nombrepila', value);

  String get primerapellido => getField<String>('primerapellido')!;
  set primerapellido(String value) => setField<String>('primerapellido', value);

  String? get segundoapellido => getField<String>('segundoapellido');
  set segundoapellido(String? value) =>
      setField<String>('segundoapellido', value);

  String get correo => getField<String>('correo')!;
  set correo(String value) => setField<String>('correo', value);

  String get telefono => getField<String>('telefono')!;
  set telefono(String value) => setField<String>('telefono', value);

  String get cedula => getField<String>('cedula')!;
  set cedula(String value) => setField<String>('cedula', value);

  String get especialidad => getField<String>('especialidad')!;
  set especialidad(String value) => setField<String>('especialidad', value);
}
