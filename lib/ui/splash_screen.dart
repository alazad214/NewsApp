import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_colors.dart';
import 'homepage.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(HomePage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white_c,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText("News App",
                    textStyle:
                        const TextStyle(fontSize: 22, fontFamily: "Font1"),
                    duration: const Duration(seconds: 5))
              ],
            ),
            Lottie.asset('asset/anim/loading.json', height: 95)
          ],
        ),
      ),
    );
  }
}
