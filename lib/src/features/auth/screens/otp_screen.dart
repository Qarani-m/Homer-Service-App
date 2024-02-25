import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homeservice/src/constants/colors.dart';
import 'package:homeservice/src/features/auth/controllers/login_controller.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 150.h, right: 20.w, left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Verification",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Enter the Verification Code Sent to  0704847676",
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: Pinput(
              onSubmitted: (value) => loginController.handleOtpSubmit(),
              defaultPinTheme: defaultPinTheme,
              validator: (s) {
                return s == '2222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => loginController.handleOtpSubmit(),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          GestureDetector(
            onTap: () => loginController.handleOtpSubmit(),
            child: Container(
              height: 50.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(20.sp)),
              child: Center(
                child: Text(
                  "Verify",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      letterSpacing: 1.5.sp,
                      fontWeight: FontWeight.w200,
                      color: AppColors.primaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
