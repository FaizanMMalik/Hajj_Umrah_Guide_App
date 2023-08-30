// ignore_for_file: no_leading_underscores_for_local_identifiers, duplicate_ignore, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  LocationData? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Location location = Location();
    // ignore: no_leading_underscores_for_local_identifiers
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    // Check if location services are enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Check for location permission
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Get the current location
    _locationData = await location.getLocation();
    setState(() {
      _currentLocation = _locationData;
    });

    // Move the map to the current location
    _mapController.move(LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!), 15.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: _currentLocation != null ? LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!) : LatLng(0, 0),
          zoom: 10.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          CircleLayerOptions(
            circles: [
              CircleMarker(
                point: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
                radius: 100.0, // 1000 meters = 1 kilometer
                color: Colors.blue.withOpacity(0.3),
                borderColor: Colors.blue,
                borderStrokeWidth: 2.0,
              ),
            ],
          ),
          MarkerLayerOptions(
            markers: _currentLocation != null
                ? [
                    Marker(
                      point: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
                      builder: (context) => const Icon(Icons.location_pin),
                    ),
                  ]
                : [],
          ),
        ],
      ),
    );
  }
}
