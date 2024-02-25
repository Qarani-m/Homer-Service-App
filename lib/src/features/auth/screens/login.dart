import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:homeservice/src/constants/colors.dart';
import 'package:homeservice/src/features/auth/controllers/login_controller.dart';
import 'package:homeservice/src/features/auth/screens/register.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 150.h, right: 20.w, left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome Back!",
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
              SizedBox(
                height: 20.h,
              ),
              Text(
                textAlign: TextAlign.center,
                "Hi, Welcom Back, You Have Been Missed",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 30.h,
              ),
              AuthTextField(
                controller: loginController.emailController,
                obscureText: false,
                trailingIcon: false,
                hintText: "Email Address",
              ),
              SizedBox(
                height: 20.h,
              ),
              PasswordAuthTextField(
                controller: loginController.passwordController,
                obscureText: true,
                trailingIcon: true,
                hintText: "Password",
              ),
               SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () => LoginController.goForgotPassword(),
                child: Container(
                  width: double.maxFinite,
                  height: 30.h,
                  alignment: Alignment.centerRight,
                  child: Text("Forgot Password?", style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            letterSpacing: 1.5.sp,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                            color: AppColors.accentColor),),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              GestureDetector(
                onTap: () => LoginController.handleSubmitForm(),
                child: Container(
                  height: 50.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.accentColor,
                      borderRadius: BorderRadius.circular(20.sp)),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          letterSpacing: 1.5.sp,
                          fontWeight: FontWeight.w200,
                          color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 20.h,
                width: double.maxFinite,
                child: Center(
                  child: Text(
                    "Or",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        letterSpacing: 1.5.sp,
                        fontWeight: FontWeight.w200,
                        color: AppColors.secondaryColor),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 50.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.secondaryColor, width: 1.sp),
                    borderRadius: BorderRadius.circular(20.sp)),
                child: Center(
                  child: Icon(
                    FontAwesomeIcons.google,
                    color: AppColors.accentColor,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () => LoginController.goToRegister(),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                          text: 'Sign up',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.accentColor)
                          // Add onTap function here if needed
                          ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
