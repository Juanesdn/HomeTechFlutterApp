import "package:flutter/material.dart";
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hometech_app/models/directions_model.dart';
import 'package:hometech_app/repository/directions_repository.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(37.773972, -122.431297), zoom: 11.5);

  Set<Marker> markers = {};

  late Position _currentPosition;
  late LatLng _pos;

  late GoogleMapController _googleMapController;
  Directions? _info;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    _currentPosition = await _determinePosition();
    setState(() {
      _pos = LatLng(_currentPosition.latitude, _currentPosition.longitude);
    });

    Marker origin = Marker(
        markerId: const MarkerId("origin"),
        infoWindow: const InfoWindow(title: 'Mi casa'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: _pos);
    markers.add(origin);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (controller) => _googleMapController = controller,
              markers: markers,
              onLongPress: _addMarker,
              polylines: {
                if (_info != null)
                  Polyline(
                      polylineId: const PolylineId('overview_polyline'),
                      color: Colors.red,
                      width: 5,
                      points: _info!.polylinePoints
                          .map((e) => LatLng(e.latitude, e.longitude))
                          .toList())
              },
            ),
            if (_info != null)
              Positioned(
                  top: 20.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                        color: Colors.yellowAccent,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0)
                        ]),
                    child: Text(
                        '${_info!.totalDistance}, ${_info!.totalDuration}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.center_focus_strong),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          onPressed: () => _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
                CameraPosition(target: _pos, zoom: 11.5)),
          ),
        ),
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    Marker destiny = Marker(
        markerId: const MarkerId("Tecnico"),
        infoWindow: const InfoWindow(title: 'Técnico Asignado'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: pos);

    setState(() {
      markers.add(destiny);
    });

    final directions = await DirectionsRepository()
        .getDirections(origin: _pos, destination: pos);
    setState(() {
      _info = directions;
    });
  }
}
