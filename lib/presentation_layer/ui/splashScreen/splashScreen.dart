import 'dart:async';
import 'package:bookly/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteScreen.HomeScreen);
    });
    initSlidingAnimation();

    // Future.delayed(
    //     Duration(seconds: 2),
    // () {
    //   Navigator.pushNamed(context, RouteScreen.HomeScreen);
    // });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(16, 11, 32, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Logo.png",
              ),
              SizedBox(
                width: 10.w,
              ),
              Image.asset(
                "assets/images/book-stack.png",
                width: 60.w,
                height: 60.h,
              ),
            ],
          ),

           SizedBox(
            height: 10.h,
          ),
          AnimatedBuilder(
              animation: slidingAnimation,
              builder: (context, _) {
                return SlideTransition(
                  position: slidingAnimation,
                  child:  Text(
                    'Read Free Books',
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                );
              }),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
       Duration(seconds: 2),
      () {
        Navigator.pushNamed(context, RouteScreen.Test);
      },
    );
  }
}
