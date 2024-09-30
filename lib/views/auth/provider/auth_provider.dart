import 'package:demo_task/core/strings.dart';
import 'package:demo_task/utils/snackbar_util.dart';
import 'package:demo_task/views/auth/screen/otp_screen.dart';
import 'package:demo_task/views/country_list/screen/country_list_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = '';
  String _phoneNumber = '';
  bool _isLoading = false;

  String get phoneNumber => _phoneNumber;
  bool get isLoading => _isLoading;

  Future<void> verifyPhoneNumber(
      String phoneNumber, BuildContext context) async {
    _isLoading = true;
    _phoneNumber = phoneNumber;
    notifyListeners();
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        _isLoading = false;
        notifyListeners();
        showSnackbar(context, e.message ?? Strings.errorVerificationFailed);
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        _isLoading = false;
        notifyListeners();
        showSnackbar(context, '${Strings.otpSent}$phoneNumber');

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OtpScreen(),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  Future<void> verifyOtp(String otp, BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: otp);

    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        showSnackbar(context, Strings.authSuccessful);

        _isLoading = false;
        notifyListeners();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const CountryListScreen(),
          ),
        );
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      showSnackbar(context, Strings.errorInvalidOtp);
    }
  }
}
