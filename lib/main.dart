import 'package:demo_task/views/auth/provider/auth_provider.dart';
import 'package:demo_task/views/city_list/provider/city_provider.dart';
import 'package:demo_task/views/country_list/provider/country_provider.dart';
import 'package:demo_task/views/home/provider/category_list_provider.dart';
import 'package:demo_task/views/home/provider/category_provider.dart';
import 'package:demo_task/views/home/provider/slider_provider.dart';
import 'package:demo_task/views/splash/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD8p2pkuCXQLEJvRTgVbB5xpSHvPAi4Owo",
          appId: "1:755953846807:android:5f1ca2897a42f8c2f82a52",
          messagingSenderId: "755953846807",
          projectId: "voice-recorder-eafd9"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CountryProvider()),
        ChangeNotifierProvider(create: (_) => CityProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => CategoryListProvider()),
        // Provide AuthProvider
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
