import 'package:demo_task/views/auth/controllers/auth_controller.dart';
import 'package:demo_task/core/strings.dart';
import 'package:demo_task/views/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../core/app_colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Consumer<AuthProvider>(builder: (context, provider, child) {
            return Stack(
              children: [
                if (provider.isLoading)
                  const Center(child: CircularProgressIndicator()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      Strings.textVerification,
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${Strings.textVerificationNumber}${provider.phoneNumber}",
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const CustomOtpField(),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class CustomOtpField extends StatefulWidget {
  final int otpLength;

  const CustomOtpField({super.key, this.otpLength = 6});

  @override
  _CustomOtpFieldState createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  List<TextEditingController> _controllers = [];
  List<FocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();
    _controllers =
        List.generate(widget.otpLength, (_) => TextEditingController());
    _focusNodes = List.generate(widget.otpLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.otpLength, (index) {
            return _buildOtpTextField(index);
          }),
        ),
        const SizedBox(
          height: 40,
        ),
        GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            String otp =
                _controllers.map((controller) => controller.text).join();
            AuthController.verifyOtp(context, otp);
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 45,
            decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(),
                const Text(
                  Strings.btnTxtContinue,
                  style: TextStyle(color: AppColors.colorWhite),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(
                      Icons.arrow_forward_sharp,
                      color: AppColors.colorWhite,
                      size: 20,
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildOtpTextField(int index) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: '',
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 2, color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 2, color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < widget.otpLength - 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
