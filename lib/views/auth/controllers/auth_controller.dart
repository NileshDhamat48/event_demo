import 'package:demo_task/views/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthController {
  static void sendOtp(BuildContext context, String phoneNumber) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.verifyPhoneNumber(phoneNumber, context);
  }

  static void verifyOtp(BuildContext context, String otp) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.verifyOtp(otp, context);
  }
}
