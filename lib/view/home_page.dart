import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ornek/provider/home_page_provider.dart';

//AIzaSyC2_fyPnGtqL1VJbqGXPbxDXYW8SdZGTkU
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyle);
    // mainPage.setMapControllerMainPage(context, controller);
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
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .8,
                      height: MediaQuery.of(context).size.width * .8,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.8),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Icon(
                            Icons.charging_station,
                            color: Colors.grey.withOpacity(.5),
                            size: 50,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Tesis Adı: "),
                              Text(selectedTesis.tesisAdi!),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Tesis türü: "),
                              Text(selectedTesis.markerType!),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Tesis is available: "),
                              if ((selectedTesis.available ?? false))
                                const Icon(Icons.check)
                              else
                                const Icon(Icons.close)
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Tesis is public: "),
                              if ((selectedTesis.public ?? false))
                                const Icon(Icons.check)
                              else
                                const Icon(Icons.close),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Adres: "),
                              Text(selectedTesis.tesisAdres!),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Tesis ili: "),
                              Text(selectedTesis.tesisIl!),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Tesis ilçesi: "),
                              Text(selectedTesis.tesisIlce!),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Tesis türü: "),
                              if ((selectedTesis.karayollariIcindeMi ?? false))
                                const Icon(Icons.check)
                              else
                                const Icon(Icons.close),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
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

class Utils {
  static String mapStyle = '''
 [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#263c3f"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#6b9a76"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#38414e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#212a37"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9ca5b3"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#1f2835"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#f3d19c"
      }
    ]
  },
  {
    "featureType": "transit",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#2f3948"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#515c6d"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  }
]
  ''';
}
