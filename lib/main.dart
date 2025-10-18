import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:zone_express/feature/welcome/screen/welcome_screen.dart';

Future<void> main() async {
  // ✅ Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Load environment variables
  await dotenv.load(fileName: ".env");

  // ✅ Run the app after .env is loaded
  runApp(GetMaterialApp(home: WelcomeScreen()));
}
