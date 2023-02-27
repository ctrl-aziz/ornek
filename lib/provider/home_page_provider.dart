import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ornek/model/tesis.dart';
import 'package:riverpod/riverpod.dart';

import '../services/api.dart';

final tesisListProvider = FutureProvider<List<Tesis>>((ref) async {
  return Api.getTesisList();
});

final markersProvider = FutureProvider<List<Marker>>((ref) async {
  final tesisList = await ref.read(tesisListProvider.future);
  final markers = tesisList.map((e) => Marker(markerId: MarkerId(e.tesisId!))).toList();
  return markers;
});

final showDetailsProvider = StateProvider<bool>((ref) {
  return false;
});

