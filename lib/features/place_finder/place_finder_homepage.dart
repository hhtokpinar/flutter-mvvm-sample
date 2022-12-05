import 'dart:async';

import '/features/place_finder/config/geolocator.dart';
import '/features/place_finder/config/providers.dart';
import '/features/place_finder/config/repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../app/global_imports.dart';
import '../../app/widgets/search_box.dart';

class PlaceFinderHomepage extends ConsumerStatefulWidget {
  const PlaceFinderHomepage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlaceFinderHomepageState();
}

class _PlaceFinderHomepageState extends ConsumerState<PlaceFinderHomepage> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kLake =
      CameraPosition(bearing: 192.8334901395799, target: LatLng(39.961885, 32.814422), tilt: 59.440717697143555, zoom: 19.151926040649414);

  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  void setLocation() async {
    //  debugPrint('old position is:');
    //  debugPrint(ref.read(PlaceFinderProviders.geolocatorCameraPosition).target.toString());
    final position = await GeoLocator.determinePosition();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(zoom: 15, target: LatLng(position.latitude, position.longitude))));
  }

  @override
  void initState() {
    super.initState();
    setLocation();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('PLACE FINDER Home Page Loaded');
    TextEditingController txtKeyword = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => NavigationRoute.goTo(context, ROUTES.home),
        ),
      ),
      body: Stack(children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: ref.watch(ProvidersPlaceFinder.geolocatorCameraPosition),
          onMapCreated: (GoogleMapController controller) {
            try {
              _controller.complete(controller);
            } catch (e) {
              debugPrint(e.toString());
            }
          },
        ),
        SearchBox(
          txtKeyword: txtKeyword,
          onSubmitted: (value) => PlaceFinderRepository.fetchMapResult(value, _kLake.target.latitude, _kLake.target.longitude),
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the home!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
