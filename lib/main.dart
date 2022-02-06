import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sociocredz/presentation/screens/auth/auth_screen.dart';
import 'package:sociocredz/presentation/screens/main/container_screen.dart';
import 'package:sociocredz/presentation/themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.black),
  );
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SocioCredz',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home:
          (_box.read('isLoggedIn') ?? false) ? ContainerScreen() : AuthScreen(),
    );
  }
}
