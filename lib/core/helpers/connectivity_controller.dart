import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityController {
  ConnectivityController._();
  static final ConnectivityController _instance = ConnectivityController._();
  factory ConnectivityController() => _instance;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  ValueNotifier<bool> isOnline = ValueNotifier<bool>(true);

  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  void checkInternetConnection() {
    if (_connectivitySubscription != null) return;

    // Check initial state
    Connectivity().checkConnectivity().then((resultList) {
      _handleConnectivityChange(resultList);
    });

    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      _handleConnectivityChange,
    );
  }

  void _handleConnectivityChange(List<ConnectivityResult> result) {
    bool newValue =
        result.isNotEmpty && !result.allContains(ConnectivityResult.none);
    isOnline.value = newValue;
  }

  void dispose() {
    _connectivitySubscription?.cancel();
    _connectivitySubscription = null;
  }
}

extension on List<ConnectivityResult> {
  bool allContains(ConnectivityResult value) {
    for (var element in this) {
      if (element != value) return false;
    }
    return true;
  }
}
