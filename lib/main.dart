import 'package:flutter/material.dart';
import 'package:weather/singletons/global.dart';
import 'package:get/get.dart';
import 'package:weather/views/homeScreen/home.dart';
import 'package:weather/views/splashScreen/splashScreen.dart';

void main() {
  runApp(const MyApp());

  Global().homeScreenController.loadAllCountries();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather Forecast',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


