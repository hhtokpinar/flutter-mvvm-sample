import '/app/global_imports.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProvidersPlaceFinder {
  static final geolocatorPosition = StateProvider<Position?>((ref) => null);
  static final geolocatorCameraPosition = StateProvider((ref) => const CameraPosition(
        target: LatLng(37.42796133580664, -122.085749655962),
        zoom: 14.4746,
      ));
}
