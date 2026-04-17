import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wainfih_data/core/theme/app_colors.dart';
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

  LatLng? currentLocation;
  double currentZoom = 15.0;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

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
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (state is LocationSuccess) {
          currentLocation = LatLng(
            state.location.latitude,
            state.location.longitude,
          );
        }

        Widget body;

        if (state is LocationLoading) {
          body = const Center(child: CircularProgressIndicator());
        } else if (state is LocationSuccess) {
          final location = currentLocation!;

          body = GoogleMap(
            initialCameraPosition: CameraPosition(
              target: location,
              zoom: currentZoom,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (point) {
              setState(() {
                currentLocation = point;
              });
            },
            onCameraMove: (position) {
              currentZoom = position.zoom;
            },
            markers: {
              Marker(
                markerId: const MarkerId('curr_loc'),
                position: location,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed,
                ),
              ),
            },
          );
        } else if (state is LocationError) {
          body = Center(child: Text(state.message));
        } else {
          body = Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<LocationCubit>().getCurrentLocation();
              },
              child: const Text('Get Current Location'),
            ),
          );
        }

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              // Always request a fresh GPS read so the button centers on the
              // current device position, not a stale marker. The BlocBuilder
              // then rebuilds with the new LocationSuccess.
              context.read<LocationCubit>().getCurrentLocation();
              if (!_controller.isCompleted) return;
              final target = state is LocationSuccess
                  ? LatLng(state.location.latitude, state.location.longitude)
                  : currentLocation;
              if (target == null) return;
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newLatLngZoom(target, currentZoom),
              );
            },
            mini: true,
            backgroundColor: Colors.white60,
            child: const Icon(Icons.my_location, color: AppColors.primaryColor),
          ),
          body: body,
        );
      },
    );
  }
}
