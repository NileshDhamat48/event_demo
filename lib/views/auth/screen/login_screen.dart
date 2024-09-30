import 'package:demo_task/views/auth/controllers/auth_controller.dart';
import 'package:demo_task/core/app_colors.dart';
import 'package:demo_task/core/strings.dart';
import 'package:demo_task/views/auth/provider/auth_provider.dart';
import 'package:demo_task/utils/common_text_field.dart';
import 'package:demo_task/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.login)),
      body: Consumer<AuthProvider>(builder: (context, provider, child) {
        return Stack(
          children: [
            if (provider.isLoading)
              const Center(child: CircularProgressIndicator()),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CommonTextField(
                    controller: _phoneController,
                    hintText: Strings.hintEnterPhoneNumber,
                    inputType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_phoneController.text.isNotEmpty) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        String phoneNumber = _phoneController.text.trim();
                        AuthController.sendOtp(context, phoneNumber);
                      } else {
                        showSnackbar(context, Strings.errorPleaseEnterNumber);
                      }
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
                            Strings.btnSendOTP,
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
              ),
            ),
          ],
        );
      }),
    );
  }
}
