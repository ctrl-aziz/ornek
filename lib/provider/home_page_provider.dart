import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ornek/model/tesis.dart';
import 'package:riverpod/riverpod.dart';

import '../services/api.dart';

final tesisListProvider = FutureProvider<List<Tesis>>((ref) async {
  return Api.getTesisList();
});

final markersProvider = FutureProvider<List<Marker>>((ref) async {
  final tesisList = await ref.read(tesisListProvider.future);
  final markers = tesisList
      .map(
        (e) => Marker(
          markerId: MarkerId(
            e.tesisId!,
          ),
          onTap: (){
            ref.read(showDetailsProvider.notifier).state = true;
            ref.read(selectedTesisProvider.notifier).state = e;
          },
          position: LatLng(
            double.parse(e.tesisLokasyonLat!),
            double.parse(e.tesisLokasyonLong!),
          ),
        ),
      )
      .toList();
  return markers;
});

final selectedTesisProvider = StateProvider<Tesis?>((ref) {
  return;
});


final showDetailsProvider = StateProvider<bool>((ref) {
  return false;
});
