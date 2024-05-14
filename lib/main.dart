import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:window_manager/window_manager.dart';
import 'app_data.dart';
import 'app.dart';

void main() async {
  // Initialize sqflite FFI databaseFactory
  databaseFactory = databaseFactoryFfi;

  // For Linux, macOS and Windows, initialize WindowManager
  try {
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      WidgetsFlutterBinding.ensureInitialized();
      await WindowManager.instance.ensureInitialized();
      windowManager.waitUntilReadyToShow().then(showWindow);
    }
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }

  // Create the AppData instance and initialize database and lists
  final appData = AppData();
  await appData.initDatabase();
  await appData.addCharacters();
  await appData.addDemons();
  await appData.addWeapons();

  // Define the app as a ChangeNotifierProvider with the same instance of AppData
  runApp(
    ChangeNotifierProvider.value(
      value: appData,
      child: const App(),
    ),
  );
}

// Show the window when it's ready
void showWindow(_) async {
  windowManager.setMinimumSize(const Size(480.0, 800.0));
  windowManager.setMaximumSize(const Size(480.0, 800.0));
  await windowManager.setTitle('The DOOM Guide');
}
