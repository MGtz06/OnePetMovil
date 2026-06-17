import '/backend/supabase/supabase.dart';
import '/components/cancelarcita_widget.dart';
import '/components/l_istavacia_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/propietario/menu_propietario/menu_propietario_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'calendario_propietario_model.dart';
export 'calendario_propietario_model.dart';

class CalendarioPropietarioWidget extends StatefulWidget {
  const CalendarioPropietarioWidget({super.key});

  static String routeName = 'CalendarioPropietario';
  static String routePath = '/calendarioPropietario';

  @override
  State<CalendarioPropietarioWidget> createState() =>
      _CalendarioPropietarioWidgetState();
}

class _CalendarioPropietarioWidgetState
    extends State<CalendarioPropietarioWidget> with TickerProviderStateMixin {
  late CalendarioPropietarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarioPropietarioModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        drawer: Drawer(
          elevation: 16,
          child: wrapWithModel(
            model: _model.menuPropietarioModel,
            updateCallback: () => safeSetState(() {}),
            child: const MenuPropietarioWidget(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3B8EB7),
          iconTheme: const IconThemeData(color: Colors.white),
          automaticallyImplyLeading: true,
          title: Align(
            alignment: const AlignmentDirectional(-1, 0),
            child: Text(
              'Citas',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0,
        ),
        body: Visibility(
          visible: responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: const Alignment(0, 0),
                      child: FlutterFlowButtonTabBar(
                        useToggleButtonStyle: true,
                        isScrollable: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                        unselectedLabelStyle: const TextStyle(),
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        unselectedBackgroundColor:
                            FlutterFlowTheme.of(context).alternate,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2,
                        borderRadius: 12,
                        elevation: 0,
                        labelPadding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                        tabs: const [
                          Tab(
                            text: 'Mes',
                          ),
                          Tab(
                            text: 'Semana',
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}, () async {}][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: const AlignmentDirectional(-1, -1),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  30, 30, 0, 0),
                                          child: Text(
                                            'Proximas citas',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.manrope(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 0),
                                        child: FutureBuilder<List<CitaRow>>(
                                          future: (_model.requestCompleter1 ??=
                                                  Completer<List<CitaRow>>()
                                                    ..complete(
                                                        CitaTable().queryRows(
                                                      queryFn: (q) => q
                                                          .eqOrNull(
                                                            'propietario',
                                                            FFAppState()
                                                                .folioUsuario,
                                                          )
                                                          .gteOrNull(
                                                            'fecha',
                                                            supaSerialize<
                                                                    DateTime>(
                                                                getCurrentTimestamp),
                                                          )
                                                          .lteOrNull(
                                                            'fecha',
                                                            supaSerialize<
                                                                    DateTime>(
                                                                functions
                                                                    .finMes()),
                                                          )
                                                          .eqOrNull(
                                                            'estado',
                                                            'PEND',
                                                          )
                                                          .order('fecha',
                                                              ascending: true)
                                                          .order('hora',
                                                              ascending: true),
                                                    )))
                                              .future,
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<CitaRow> listViewCitaRowList =
                                                snapshot.data!;

                                            if (listViewCitaRowList.isEmpty) {
                                              return const LIstavaciaWidget();
                                            }

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewCitaRowList.length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewCitaRow =
                                                    listViewCitaRowList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(30, 15, 30, 0),
                                                  child: Container(
                                                    width: 310,
                                                    height: 216.8,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 4,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0,
                                                            2,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(15),
                                                        topRight:
                                                            Radius.circular(15),
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(15),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            const Color(0x95574F4F),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FutureBuilder<
                                                              List<
                                                                  VeterinarioRow>>(
                                                            future: VeterinarioTable()
                                                                .querySingleRow(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                'folio',
                                                                listViewCitaRow
                                                                    .veterinario,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<VeterinarioRow>
                                                                  rowVeterinarioRowList =
                                                                  snapshot
                                                                      .data!;

                                                              final rowVeterinarioRow =
                                                                  rowVeterinarioRowList
                                                                          .isNotEmpty
                                                                      ? rowVeterinarioRowList
                                                                          .first
                                                                      : null;

                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          68.1,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(20),
                                                                          topRight:
                                                                              Radius.circular(20),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                20,
                                                                                20,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              child: Image.asset(
                                                                                'assets/images/estetoscopio_(1).png',
                                                                                width: 38.1,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(0, 0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Dr(a).${rowVeterinarioRow?.primerapellido} ${rowVeterinarioRow?.nombrepila}',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.manrope(
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        FutureBuilder<List<EspecialidadRow>>(
                                                                                          future: EspecialidadTable().querySingleRow(
                                                                                            queryFn: (q) => q.eqOrNull(
                                                                                              'clave',
                                                                                              rowVeterinarioRow?.especialidad,
                                                                                            ),
                                                                                          ),
                                                                                          builder: (context, snapshot) {
                                                                                            // Customize what your widget looks like when it's loading.
                                                                                            if (!snapshot.hasData) {
                                                                                              return Center(
                                                                                                child: SizedBox(
                                                                                                  width: 50,
                                                                                                  height: 50,
                                                                                                  child: CircularProgressIndicator(
                                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<EspecialidadRow> textEspecialidadRowList = snapshot.data!;

                                                                                            final textEspecialidadRow = textEspecialidadRowList.isNotEmpty ? textEspecialidadRowList.first : null;

                                                                                            return Text(
                                                                                              valueOrDefault<String>(
                                                                                                textEspecialidadRow?.nombre,
                                                                                                'Medico General',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.manrope(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                          Divider(
                                                            thickness: 2,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1,
                                                                          0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          143.8,
                                                                      height:
                                                                          25.7,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        color: Color(
                                                                            0xFFD0DAF1),
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(20),
                                                                          topRight:
                                                                              Radius.circular(20),
                                                                          bottomLeft:
                                                                              Radius.circular(20),
                                                                          bottomRight:
                                                                              Radius.circular(20),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1, 0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10, 2, 0, 2),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                child: Image.asset(
                                                                                  'assets/images/calendario_(3).png',
                                                                                  width: 16.8,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              dateTimeFormat(
                                                                                "yMMMd",
                                                                                listViewCitaRow.fecha,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.manrope(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0, 1),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Mascota:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                10,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1,
                                                                          0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          143.8,
                                                                      height:
                                                                          26.2,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        color: Color(
                                                                            0xFFC4E3F3),
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(20),
                                                                          topRight:
                                                                              Radius.circular(20),
                                                                          bottomLeft:
                                                                              Radius.circular(20),
                                                                          bottomRight:
                                                                              Radius.circular(20),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                2,
                                                                                2,
                                                                                0),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              child: Image.asset(
                                                                                'assets/images/reloj.png',
                                                                                width: 17,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              dateTimeFormat(
                                                                                "Hm",
                                                                                listViewCitaRow.hora.time,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              '15:09',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1,
                                                                            0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              15,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                108.2,
                                                                            height:
                                                                                26.45,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Color(0xFFB7F9F0),
                                                                              borderRadius: BorderRadius.only(
                                                                                topLeft: Radius.circular(20),
                                                                                topRight: Radius.circular(20),
                                                                                bottomLeft: Radius.circular(20),
                                                                                bottomRight: Radius.circular(20),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(10, 2, 2, 0),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    child: Image.asset(
                                                                                      'assets/images/perro_(1).png',
                                                                                      width: 17,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                FutureBuilder<List<MascotaRow>>(
                                                                                  future: MascotaTable().querySingleRow(
                                                                                    queryFn: (q) => q.eqOrNull(
                                                                                      'folio',
                                                                                      listViewCitaRow.mascota,
                                                                                    ),
                                                                                  ),
                                                                                  builder: (context, snapshot) {
                                                                                    // Customize what your widget looks like when it's loading.
                                                                                    if (!snapshot.hasData) {
                                                                                      return Center(
                                                                                        child: SizedBox(
                                                                                          width: 50,
                                                                                          height: 50,
                                                                                          child: CircularProgressIndicator(
                                                                                            valueColor: AlwaysStoppedAnimation<Color>(
                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                    List<MascotaRow> textMascotaRowList = snapshot.data!;

                                                                                    final textMascotaRow = textMascotaRowList.isNotEmpty ? textMascotaRowList.first : null;

                                                                                    return Text(
                                                                                      valueOrDefault<String>(
                                                                                        textMascotaRow?.nombre,
                                                                                        'copito',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.manrope(
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        20,
                                                                        0,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              14),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          FFAppState().cancelarCitaFolio =
                                                                              listViewCitaRow.folio;
                                                                          safeSetState(
                                                                              () {});
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(context).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: const CancelarcitaWidget(),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));

                                                                          safeSetState(() =>
                                                                              _model.requestCompleter1 = null);
                                                                          await _model
                                                                              .waitForRequestCompleted1();
                                                                          safeSetState(() =>
                                                                              _model.requestCompleter2 = null);
                                                                          await _model
                                                                              .waitForRequestCompleted2();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                const Color(0xfffffffff),
                                                                            boxShadow: const [
                                                                              BoxShadow(
                                                                                blurRadius: 4,
                                                                                color: Color(0x33000000),
                                                                                offset: Offset(
                                                                                  0,
                                                                                  2,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(20),
                                                                              topRight: Radius.circular(20),
                                                                              bottomLeft: Radius.circular(20),
                                                                              bottomRight: Radius.circular(20),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              color: const Color(0xFF929090),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0, 0),
                                                                            child:
                                                                                Text(
                                                                              'Cancelar',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 17,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 24),
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(16, 0, 16, 12),
                                              child: Container(
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 3,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0,
                                                        1,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 3,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            0,
                                            1,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 0, 0),
                                        child: Text(
                                          'Proximas citas',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 0),
                                        child: FutureBuilder<List<CitaRow>>(
                                          future: (_model.requestCompleter2 ??= Completer<List<CitaRow>>()
                                                ..complete(CitaTable().queryRows(
                                                  queryFn: (q) => q
                                                      .gteOrNull('fecha', supaSerialize<DateTime>(functions.inicioSemana()))
                                                      .lteOrNull('fecha', supaSerialize<DateTime>(functions.finSemana()))
                                                      .eqOrNull('propietario', FFAppState().folioUsuario)
                                                      .eqOrNull('estado', 'PEND')
                                                      .order('fecha', ascending: true) // Orden incremental por fecha 
                                                      .order('hora', ascending: true),  // Orden incremental por hora 
                                                )))
                                              .future,
                                          builder: (context, snapshot) {
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: CircularProgressIndicator(
                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                      FlutterFlowTheme.of(context).primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<CitaRow> citasSemanaList = snapshot.data!;
                                            if (citasSemanaList.isEmpty) {
                                              return const LIstavaciaWidget(); // Respeta el diseño de lista vacía [cite: 1151]
                                            }

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: citasSemanaList.length,
                                              itemBuilder: (context, index) {
                                                final cita = citasSemanaList[index];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                                                  child: Container(
                                                    width: 310,
                                                    height: 216.8,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 4,
                                                          color: Color(0x33000000),
                                                          offset: Offset(0, 2),
                                                        )
                                                      ],
                                                      borderRadius: BorderRadius.circular(15),
                                                      border: Border.all(color: const Color(0x95574F4F), width: 1),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        // BUSCAR DATOS DEL VETERINARIO
                                                        FutureBuilder<List<VeterinarioRow>>(
                                                          future: VeterinarioTable().querySingleRow(
                                                            queryFn: (q) => q.eqOrNull('folio', cita.veterinario),
                                                          ),
                                                          builder: (context, veteSnapshot) {
                                                            final vete = veteSnapshot.data?.firstOrNull;
                                                            return Row(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                                                                  child: ClipRRect(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    child: Image.asset(
                                                                      'assets/images/estetoscopio_(1).png',
                                                                      width: 38.1,
                                                                      fit: BoxFit.cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Padding(
                                                                    padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text(
                                                                          'Dr(a). ${vete?.primerapellido ?? ""} ${vete?.nombrepila ?? ""}',
                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                            font: GoogleFonts.manrope(fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                        // BUSCAR ESPECIALIDAD
                                                                        FutureBuilder<List<EspecialidadRow>>(
                                                                          future: EspecialidadTable().querySingleRow(
                                                                            queryFn: (q) => q.eqOrNull('clave', vete?.especialidad),
                                                                          ),
                                                                          builder: (context, espSnapshot) {
                                                                            final esp = espSnapshot.data?.firstOrNull;
                                                                            return Text(
                                                                              esp?.nombre ?? 'Médico General',
                                                                              style: FlutterFlowTheme.of(context).bodySmall,
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                        Divider(thickness: 2, color: FlutterFlowTheme.of(context).alternate),
                                                        // FILA DE FECHA Y ETIQUETA MASCOTA
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                                              child: Container(
                                                                height: 25.7,
                                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                                decoration: BoxDecoration(
                                                                  color: const Color(0xFFD0DAF1),
                                                                  borderRadius: BorderRadius.circular(20),
                                                                ),
                                                                child: Row(
                                                                  children: [
                                                                    Image.asset('assets/images/calendario_(3).png', width: 16.8),
                                                                    const SizedBox(width: 5),
                                                                    Text(
                                                                      dateTimeFormat("yMMMd", cita.fecha, locale: FFLocalizations.of(context).languageCode),
                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                        font: GoogleFonts.manrope(fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            const Padding(
                                                              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                                              child: Text('Mascota:', style: TextStyle(fontSize: 10)),
                                                            ),
                                                          ],
                                                        ),
                                                        // FILA DE HORA Y NOMBRE DE MASCOTA
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsetsDirectional.fromSTEB(15, 4, 0, 0),
                                                              child: Container(
                                                                height: 26.2,
                                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                                decoration: BoxDecoration(
                                                                  color: const Color(0xFFC4E3F3),
                                                                  borderRadius: BorderRadius.circular(20),
                                                                ),
                                                                child: Row(
                                                                  children: [
                                                                    Image.asset('assets/images/reloj.png', width: 17),
                                                                    const SizedBox(width: 5),
                                                                    Text(
                                                                      dateTimeFormat("Hm", cita.hora.time, locale: FFLocalizations.of(context).languageCode),
                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                        font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            // BUSCAR NOMBRE DE MASCOTA
                                                            FutureBuilder<List<MascotaRow>>(
                                                              future: MascotaTable().querySingleRow(
                                                                queryFn: (q) => q.eqOrNull('folio', cita.mascota),
                                                              ),
                                                              builder: (context, petSnapshot) {
                                                                final mascota = petSnapshot.data?.firstOrNull;
                                                                return Padding(
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                                                  child: Container(
                                                                    height: 26.45,
                                                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                                                    decoration: BoxDecoration(
                                                                      color: const Color(0xFFB7F9F0),
                                                                      borderRadius: BorderRadius.circular(20),
                                                                    ),
                                                                    child: Row(
                                                                      children: [
                                                                        Image.asset('assets/images/perro_(1).png', width: 17),
                                                                        const SizedBox(width: 5),
                                                                        Text(
                                                                          mascota?.nombre ?? 'Cargando...',
                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                            font: GoogleFonts.manrope(fontWeight: FontWeight.w600),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        // BOTÓN CANCELAR
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              FFAppState().cancelarCitaFolio = cita.folio;
                                                              await showModalBottomSheet(
                                                                context: context,
                                                                builder: (context) => const CancelarcitaWidget(),
                                                              );
                                                              // Resetear ambos completers para refrescar [cite: 1160]
                                                              safeSetState(() => _model.requestCompleter2 = null);
                                                              await _model.waitForRequestCompleted2();
                                                              safeSetState(() => _model.requestCompleter1 = null);
                                                              await _model.waitForRequestCompleted1();
                                                            },
                                                            child: Container(
                                                              width: double.infinity,
                                                              height: 45,
                                                              margin: const EdgeInsets.symmetric(horizontal: 14),
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.circular(20),
                                                                border: Border.all(color: const Color(0xFF929090)),
                                                              ),
                                                              child: const Center(
                                                                child: Text('Cancelar', style: TextStyle(fontSize: 17)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        )
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


