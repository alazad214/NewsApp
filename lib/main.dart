import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/const/app_colors.dart';
import 'package:newsapp/ui/homepage.dart';
import 'package:newsapp/route/route.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: GetMaterialApp(
        home: Splash_Screen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

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
      //Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
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
            Lottie.asset('asset/anim/loading.json', height: 100)
          ],
        ),
      ),
    );
  }
}
