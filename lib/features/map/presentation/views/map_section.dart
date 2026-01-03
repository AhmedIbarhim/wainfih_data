import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:wainfih_data/core/theme/app_colors.dart';
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
  double currentZoom = 15.0;
  final MapController controller = MapController();

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (currentLocation != null) {
            controller.move(currentLocation!, currentZoom);
          }
        },
        mini: true,
        backgroundColor: Colors.white60,
        child: const Icon(Icons.my_location, color: AppColors.primaryColor),
      ),
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          if (state is LocationLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is LocationSuccess) {
            currentLocation ??= state.location.toLatLng;
            return FlutterMap(
              mapController: controller,
              options: MapOptions(
                initialCenter: currentLocation!,
                initialZoom: currentZoom,
                onTap: (tapPosition, point) {
                  setState(() {
                    currentLocation = point;
                  });
                  // controller.move(point, currentZoom);
                },
                onPositionChanged: (position, hasGesture) {
                  setState(() {
                    currentZoom = position.zoom;
                  });
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: EndPoints.mapUrl,
                  maxZoom: 20,
                  minZoom: 1,
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
