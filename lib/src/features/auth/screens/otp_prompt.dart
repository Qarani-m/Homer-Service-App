import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homeservice/src/constants/colors.dart';
import 'package:homeservice/src/features/auth/controllers/login_controller.dart';
import 'package:homeservice/src/features/auth/screens/register.dart';

class OtpPrompt extends StatelessWidget {
  OtpPrompt({super.key});
  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60.h, right: 20.w, left: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50.h,
              width: double.maxFinite,
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: ()=>loginController.goBack(),
                child: Icon(Icons.arrow_back),
              ),
             
            ),
            SizedBox(height: 90.h,),
            Text(
              "Phone Number",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Enter A Valid Phone Number To Send Verification Code To",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.h,
            ),
            AuthTextField(
              controller: loginController.emailController,
              obscureText: false,
              trailingIcon: false,
              hintText: " Phone Number",
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () => loginController.sendOtpCode(),
              child: Container(
                height: 50.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.circular(20.sp)),
                child: Center(
                  child: Text(
                    "Send Code",
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
      ),
    );
  }
}
