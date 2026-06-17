import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/propietario/menu_propietario/menu_propietario_widget.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:geolocator/geolocator.dart';

import 'mapa_screen_model.dart';
export 'mapa_screen_model.dart';

class MapaScreenWidget extends StatefulWidget {
  const MapaScreenWidget({super.key});

  static String routeName = 'mapaScreen';
  static String routePath = '/mapaScreen';

  @override
  State<MapaScreenWidget> createState() => _MapaScreenWidgetState();
}

class _MapaScreenWidgetState extends State<MapaScreenWidget> {
  late MapaScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapaScreenModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.latHospital = 32.4873155;
      _model.longHospita = -116.9345324;

      _model.latActual = 0;
      _model.longActual = 0;
      _model.tieneUbicacion = false;

      await requestPermission(locationPermission);

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        try {
          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );

          _model.latActual = position.latitude;
          _model.longActual = position.longitude;
          _model.tieneUbicacion = true;

          //centrar mapa en usuario
          mapController.move(
            latlng.LatLng(_model.latActual!, _model.longActual!),
            15,
          );
        } catch (e) {
          _model.tieneUbicacion = false;
        }
      } else {
        _model.tieneUbicacion = false;
      }

      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final centro = (_model.latActual != null &&
            _model.longActual != null &&
            _model.latActual != 0 &&
            _model.longActual != 0)
        ? latlng.LatLng(_model.latActual!, _model.longActual!)
        : latlng.LatLng(_model.latHospital!, _model.longHospita!);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,

      drawer: Drawer(
        child: wrapWithModel(
          model: _model.menuPropietarioModel,
          updateCallback: () => safeSetState(() {}),
          child: const MenuPropietarioWidget(),
        ),
      ),

      appBar: AppBar(
        backgroundColor: const Color(0xFF3B8EB7),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Ubicación del hospital',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                color: Colors.white,
                fontSize: 20,
              ),
        ),
      ),

      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          initialCenter: centro,
          initialZoom: 15,
        ),

        children: [
          TileLayer(
            urlTemplate:
                "https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: 'com.onepet.org',
          ),

          MarkerLayer(
            markers: [
              //Hospital
              Marker(
                point: latlng.LatLng(
                  _model.latHospital!,
                  _model.longHospita!,
                ),
                width: 40,
                height: 40,
                child: const Icon(Icons.location_pin, size: 40),
              ),

              //Usuario
              if (_model.tieneUbicacion == true)
                Marker(
                  point: latlng.LatLng(
                    _model.latActual!,
                    _model.longActual!,
                  ),
                  width: 40,
                  height: 40,
                  child: const Icon(Icons.person_pin_circle, size: 40),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
