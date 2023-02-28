import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../provider/home_page_provider.dart';
import '../utils/map_utils.dart';
import '../widgets/details_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(MapUtils.mapStyle);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final markers = ref.watch(markersProvider);
    final selectedTesis = ref.watch(selectedTesisProvider);
    return WillPopScope(
      onWillPop: () async {
        if (selectedTesis != null) {
          ref.read(selectedTesisProvider.notifier).state = null;
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: markers.when(
          data: (markers) {
            return Stack(
              children: [
                GoogleMap(
                  onTap: (d) {
                    ref.read(selectedTesisProvider.notifier).state = null;
                    print("on Map Tap");
                  },
                  // 37.1793537,33.2600816,13z
                  // 37.1785331,33.227466,13z
                  initialCameraPosition: const CameraPosition(
                      target: LatLng(37.1793537, 33.22), zoom: 13),
                  mapType: MapType.normal,
                  onMapCreated: _onMapCreated,
                  markers: markers.toSet(),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  scrollGesturesEnabled: true,
                  rotateGesturesEnabled: true,
                  onCameraMove: (cameraPosition) {},
                ),
                if (selectedTesis != null)
                  DetailsCard(tesis: selectedTesis)
              ],
            );
          },
          error: (e, s) {
            print(e);
            print(s);
            return Text('Error: $e s: $s');
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}