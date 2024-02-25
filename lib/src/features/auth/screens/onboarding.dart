// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homeservice/src/constants/images.dart';
import 'package:homeservice/src/constants/strings.dart';
import 'package:homeservice/src/features/auth/controllers/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key});
  OnboardingController onboardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            controller: onboardingController.pageController,
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return OnBoarding(
                image: AppImages.onboardingImages[index],
                title: AppStrings.onboarding["title"]![index],
                subtitle: AppStrings.onboarding["subTitle"]![index],
                index: index,
              );
            }));
  }
}

class OnBoarding extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final int index;
  OnBoarding({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.index,
  });

  OnboardingController onboardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 60.h),
          height: 550.h,
          width: double.maxFinite,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                height: 50.h,
                width: double.maxFinite,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("", style: Theme.of(context).textTheme.bodyLarge),
                    Text("", style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              Container(
                height: 440.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  // color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 262.h,
          width: double.maxFinite,
          child: Column(
            children: [
              Text(title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(
                height: 30.h,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.h,
              ),
              GestureDetector(
                onTap: () => {
                  if (index == 2)
                    {
                      onboardingController
                          .goToLogin() // Call the method from the controller
                    }
                  else
                    {onboardingController.animateToNextPage(index)}
                },
                child: CircleAvatar(
                  backgroundColor: const Color(0xFF6759ff),
                  radius: 20.w,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
