import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/input_screen.dart';
import 'screens/result_screen.dart';
import 'bindings/nic_binding.dart';

/// ✅ The entry point of the application.
void main() {
  runApp(const NICApp());
}

/// ✅ The main application widget.
class NICApp extends StatelessWidget {
  /// Developer name
  static const String developerName = 'Pasindu Dilhara';

  /// ✅ Creates an instance of [NICApp].
  const NICApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title:
          'National ID card (NIC) decoder  - $developerName', // Shows in recent apps
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed:
            const Color.fromARGB(255, 49, 3, 41), // Deep Blue Theme
        brightness: Brightness.light, // Light theme
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed:
            const Color.fromARGB(255, 2, 39, 93), // Darker Blue for Dark Mode
        brightness: Brightness.dark,
      ),
      themeMode:
          ThemeMode.system, // Automatically switches based on system settings
      initialBinding: NICBinding(), // Binds dependencies using GetX
      initialRoute: '/', // Sets the initial route of the app
      getPages: [
        GetPage(name: '/', page: () => InputScreen()), // Home screen route
        GetPage(
            name: '/result', page: () => ResultScreen()), // Result screen route
      ],
    );
  }
}
