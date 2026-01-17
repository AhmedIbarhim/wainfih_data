import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:wainfih_data/no_connection_view.dart';

class ConnectivityController {
  static final ConnectivityController _instance = ConnectivityController._();
  factory ConnectivityController() => _instance;
  ConnectivityController._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  ValueNotifier<bool> isOnline = ValueNotifier<bool>(true);
  bool isNoConnectionShown = false;

  void checkInternetConnection() {
    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      bool newValue = !result.contains(ConnectivityResult.none);
      if (!newValue && !isNoConnectionShown) {
        navigatorKey.currentState?.push(
          MaterialPageRoute(builder: (_) => const NoConnectionView()),
        );
        isNoConnectionShown = true;
      } else if (newValue && isNoConnectionShown) {
        navigatorKey.currentState?.pop();
        isNoConnectionShown = false;
      }
      isOnline.value = newValue;
    });
  }
}
