import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../data/end_points.dart';
import '../manager/location_cubit.dart';
import '../manager/location_states.dart';

class MapSection extends StatefulWidget {
  const MapSection({super.key});

  @override
  State<MapSection> createState() => _MapSectionState();
}

class _MapSectionState extends State<MapSection> {
  LatLng? currentLocation;
  MapController controller = MapController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LocationCubit>().getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          if (state is LocationLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is LocationSuccess) {
            currentLocation = state.location.toLatLng;
            return FlutterMap(
              options: MapOptions(
                initialCenter: currentLocation!,
                onTap: (tapPosition, point) {
                  setState(() {
                    currentLocation = point;
                  });
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: EndPoints.mapUrl,
                  maxZoom: 20,
                  minZoom: 20,
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: currentLocation!,
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }

          if (state is LocationError) {
            return Center(child: Text(state.message));
          }

          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<LocationCubit>().getCurrentLocation();
              },
              child: const Text('Get Current Location'),
            ),
          );
        },
      ),
    );
  }
}
