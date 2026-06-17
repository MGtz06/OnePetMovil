import '../database.dart';

class PropietarioTable extends SupabaseTable<PropietarioRow> {
  @override
  String get tableName => 'propietario';

  @override
  PropietarioRow createRow(Map<String, dynamic> data) => PropietarioRow(data);
}

class PropietarioRow extends SupabaseDataRow {
  PropietarioRow(super.data);

  @override
  SupabaseTable get table => PropietarioTable();

  String get folio => getField<String>('folio')!;
  set folio(String value) => setField<String>('folio', value);

  String get nombrepila => getField<String>('nombrepila')!;
  set nombrepila(String value) => setField<String>('nombrepila', value);

  String get primerapellido => getField<String>('primerapellido')!;
  set primerapellido(String value) => setField<String>('primerapellido', value);

  String? get segundoapellido => getField<String>('segundoapellido');
  set segundoapellido(String? value) =>
      setField<String>('segundoapellido', value);

  String get dircalle => getField<String>('dircalle')!;
  set dircalle(String value) => setField<String>('dircalle', value);

  String get dirnum => getField<String>('dirnum')!;
  set dirnum(String value) => setField<String>('dirnum', value);

  String get dircolonia => getField<String>('dircolonia')!;
  set dircolonia(String value) => setField<String>('dircolonia', value);

  String get correo => getField<String>('correo')!;
  set correo(String value) => setField<String>('correo', value);
}
