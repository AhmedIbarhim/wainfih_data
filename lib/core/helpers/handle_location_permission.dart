import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

Future<bool> handleLocationPermission(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    _showLocationServiceDialog(context);
    return false;
  }
  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permissions are denied')),
      );
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Location permissions are permanently denied, we cannot request permissions.',
        ),
      ),
    );
    return false;
  }
  return true;
}

Future<void> _showLocationServiceDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          "خدمات الموقع معطلة. يرجى تفعيل الخدمات",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          "يرجى تفعيل خدمات الموقع لاستخدام هذه الميزة",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              await Geolocator.openLocationSettings();

              Navigator.of(context).pop();
            },
            child: Text("فتح الإعدادات"),
          ),
        ],
      );
    },
  );
}
