import 'dart:async';

import 'package:demo_task/core/app_images.dart';
import 'package:demo_task/views/auth/screen/login_screen.dart';
import 'package:demo_task/views/country_list/screen/country_list_screen.dart';
import 'package:demo_task/views/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    navigateToNext();
  }

  navigateToNext() async {
    final prefs = await SharedPreferences.getInstance();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => prefs.getBool('isLoggedIn') ?? false
                  ? const CountryListScreen()
                  : LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            AppImages.splashBackground,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
