import 'package:brothergps/src/ui/historic_n/historic_n_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';

class MyMarkerLayer extends StatelessWidget {
  const MyMarkerLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HistoricProviderN, List<Marker>>(
        selector: (_, p) => p.markers,
        builder: (_, markers, __) {
          return MarkerLayer(
            markers: markers,
          );
        });
  }
}
