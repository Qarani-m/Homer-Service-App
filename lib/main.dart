import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homeservice/src/features/auth/screens/login.dart';
import 'package:homeservice/src/features/auth/screens/onboarding.dart';
import 'package:homeservice/src/features/auth/screens/otp_prompt.dart';
import 'package:homeservice/src/features/auth/screens/otp_screen.dart';
import 'package:homeservice/src/features/auth/screens/register.dart';
import 'package:homeservice/src/utils/themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Define your named routes
  static final routes = [
    // auth routes
    GetPage(name: '/onboarding', page: () => OnboardingPage()),
    GetPage(name: '/register', page: () => Register()),
    GetPage(name: '/login', page: () => Login()),
    GetPage(name: '/otp', page: () =>  OtpScreen()),
    GetPage(name: '/forgot_password', page: () =>  OtpPrompt()),
    // home routes
    
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
         debugShowCheckedModeBanner: false,
         title:'DoorHub',
         theme: LightThemeManager.getThemeData(),
          themeMode: ThemeMode.light,
          getPages: routes,
          initialRoute: '/register',
        );
      },
    );
  }
}