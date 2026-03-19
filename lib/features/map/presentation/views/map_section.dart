import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart' as ll;
import 'package:wainfih_data/core/theme/app_colors.dart';
import 'package:wainfih_data/features/adding_new_provider/domain/provider_model.dart';
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

  late ll.LatLng currentLocation;
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
          currentLocation = state.location.toLatLng();
        }

        Widget body;

        if (state is LocationLoading) {
          body = const Center(child: CircularProgressIndicator());
        } else if (state is LocationSuccess) {
          context.read<ProviderModel>().location ??= state.location.toLatLng();
          final location = context.read<ProviderModel>().location!;

          body = GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(location.latitude, location.longitude),
              zoom: currentZoom,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (point) {
              setState(() {
                context.read<ProviderModel>().location = ll.LatLng(
                  point.latitude,
                  point.longitude,
                );
              });
            },
            onCameraMove: (position) {
              currentZoom = position.zoom;
            },
            markers: {
              Marker(
                markerId: const MarkerId('curr_loc'),
                position: LatLng(location.latitude, location.longitude),
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
              final GoogleMapController controller = await _controller.future;
              context.read<ProviderModel>().location = currentLocation;
              controller.animateCamera(
                CameraUpdate.newLatLngZoom(
                  LatLng(currentLocation.latitude, currentLocation.longitude),
                  currentZoom,
                ),
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
