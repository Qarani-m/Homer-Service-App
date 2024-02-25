import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homeservice/src/constants/colors.dart';
import 'package:homeservice/src/features/auth/controllers/login_controller.dart';
import 'package:homeservice/src/features/auth/controllers/signup_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final SignUpcontroller signUpcontroller = Get.put(SignUpcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 80.h, right: 20.w, left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  child: Text(
                    "Create Account",
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
              SizedBox(
                height: 20.h,
              ),
              Text(
                textAlign: TextAlign.center,
                "Fill your information below or register with your social account.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 30.h,
              ),
              AuthTextField(
                controller: signUpcontroller.firstNameController,
                obscureText: false,
                trailingIcon: false,
                hintText: "First Name",
              ),
              SizedBox(
                height: 20.h,
              ),
              AuthTextField(
                controller: signUpcontroller.lastNameController,
                obscureText: false,
                trailingIcon: false,
                hintText: "Last Name",
              ),
              SizedBox(
                height: 20.h,
              ),
              AuthTextField(
                controller: signUpcontroller.emailAddressController,
                obscureText: false,
                trailingIcon: false,
                hintText: "Email Address",
              ),
              SizedBox(
                height: 20.h,
              ),
              AuthTextField(
                controller: signUpcontroller.phoneNumberController,
                obscureText: false,
                trailingIcon: false,
                hintText: "Phone Number",
              ),
              SizedBox(
                height: 20.h,
              ),
              PasswordAuthTextField(
                controller: signUpcontroller.passwordController,
                obscureText: true,
                trailingIcon: true,
                hintText: "Password",
              ),
              SizedBox(
                height: 50.h,
              ),
              GestureDetector(
                onTap: () => SignUpcontroller.handleSubmitForm(),
                child: Container(
                  height: 50.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.accentColor,
                      borderRadius: BorderRadius.circular(20.sp)),
                  child: Center(
                    child: Text(
                      "Sign Up",
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
                onTap: () => SignUpcontroller.goToLogin(),
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

class AuthTextField extends StatelessWidget {
  AuthTextField({
    Key? key,
    required this.obscureText,
    required this.trailingIcon,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  final bool obscureText;
  final bool trailingIcon;
  final String hintText;
  final TextEditingController controller;
  final SignUpcontroller signUpcontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Obx(
        () => TextFormField(
          controller: controller,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              letterSpacing: 1.5.sp,
              fontWeight: FontWeight.w200), // Adjust the text style here
          obscureText: signUpcontroller.obscureTextStatus.value,

          decoration: InputDecoration(
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(letterSpacing: 1.5.sp, fontWeight: FontWeight.w200, fontSize: 12.sp),
            hintText: hintText,
            filled: true,
            fillColor: const Color(0xFFf4f6f9), // Background color
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0), // Rounded corners
              borderSide: BorderSide.none, // No border
            ),
            // Trailing icon
            suffixIcon: trailingIcon
                ? signUpcontroller.trailingIconStatus.value
                    ? GestureDetector(
                        onTap: () => signUpcontroller.trailingIconStatus.value =
                            !signUpcontroller.trailingIconStatus.value,
                        child: const Icon(Icons.add_circle_outline),
                      )
                    : GestureDetector(
                        onTap: () => signUpcontroller.trailingIconStatus.value =
                            !signUpcontroller.trailingIconStatus.value,
                        child: const Icon(Icons.add_home),
                      )
                : null, // Set to null if no trailing icon needed
          ),
        ),
      ),
    );
  }
}

class PasswordAuthTextField extends StatelessWidget {
  PasswordAuthTextField({
    Key? key,
    required this.obscureText,
    required this.trailingIcon,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  final bool obscureText;
  final bool trailingIcon;
  final String hintText;
  final TextEditingController controller;

  final SignUpcontroller signUpcontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Obx(
        () => TextFormField(
          controller: controller,

          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              letterSpacing: 1.5.sp,
              fontWeight: FontWeight.w200), // Adjust the text style here
          obscureText: signUpcontroller.trailingIconStatus.value,
          decoration: InputDecoration(
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(letterSpacing: 1.5.sp, fontWeight: FontWeight.w200),

            hintText: hintText,
            filled: true,
            fillColor: const Color(0xFFf4f6f9), // Background color
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0), // Rounded corners
              borderSide: BorderSide.none, // No border
            ),
            // Trailing icon
            suffixIcon: trailingIcon
                ? signUpcontroller.trailingIconStatus.value
                    ? GestureDetector(
                        onTap: () => signUpcontroller.trailingIconStatus.value =
                            !signUpcontroller.trailingIconStatus.value,
                        child: const Icon(Icons.add_circle_outline),
                      )
                    : GestureDetector(
                        onTap: () => signUpcontroller.trailingIconStatus.value =
                            !signUpcontroller.trailingIconStatus.value,
                        child: const Icon(Icons.add_home),
                      )
                : null, // Set to null if no trailing icon needed
          ),
        ),
      ),
    );
  }
}
