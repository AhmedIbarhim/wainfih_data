import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:wainfih_data/core/theme/app_colors.dart';
import 'package:wainfih_data/features/home/domain/provider_model.dart';
import '../../data/end_points.dart';
import '../manager/location_cubit.dart';
import '../manager/location_states.dart';

class MapSection extends StatefulWidget {
  const MapSection({super.key});

  @override
  State<MapSection> createState() => _MapSectionState();
}

class _MapSectionState extends State<MapSection>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

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
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (context.read<ProviderModel>().location != null) {
            controller.move(
              context.read<ProviderModel>().location!,
              currentZoom,
            );
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
            context.read<ProviderModel>().location ??= state.location
                .toLatLng();
            return FlutterMap(
              mapController: controller,
              options: MapOptions(
                initialCenter: context.read<ProviderModel>().location!,
                initialZoom: currentZoom,
                onTap: (tapPosition, point) {
                  setState(() {
                    context.read<ProviderModel>().location = point;
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
                      point: context.read<ProviderModel>().location!,
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
