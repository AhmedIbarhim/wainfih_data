import 'package:flutter/material.dart';

import 'app.dart';
import 'core/di/service_locator.dart';
import 'core/local_caching/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await SharedPrefs.init();
  runApp(const App());
}
