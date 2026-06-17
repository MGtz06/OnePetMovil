import '../database.dart';

class AdministradorTable extends SupabaseTable<AdministradorRow> {
  @override
  String get tableName => 'administrador';

  @override
  AdministradorRow createRow(Map<String, dynamic> data) =>
      AdministradorRow(data);
}

class AdministradorRow extends SupabaseDataRow {
  AdministradorRow(super.data);

  @override
  SupabaseTable get table => AdministradorTable();

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
}
