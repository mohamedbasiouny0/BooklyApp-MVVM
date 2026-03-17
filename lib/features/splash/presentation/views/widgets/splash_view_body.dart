import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:test2/core/utils/app_router.dart';

import 'animated_logo.dart';
import 'animated_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  late Animation<double> _textOpacity;
  late Animation<Offset> _textSlide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    // Logo: scale from 0.6 → 1.0
    _logoScale = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.55, curve: Curves.elasticOut),
      ),
    );

    // Logo: fade in
    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.40, curve: Curves.easeIn),
      ),
    );

    // Text: fade in (starts after logo)
    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.50, 0.85, curve: Curves.easeIn),
      ),
    );

    // Text: slide up from slight offset
    _textSlide = Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.50, 0.90, curve: Curves.easeOut),
          ),
        );

    _controller.forward();
    navigateToHome();
  }

  Future<void> navigateToHome() {
    return Future.delayed(const Duration(milliseconds: 2500), () {
      // Get.offAll(
      //   () => HomeView(),
      //   transition: Transition.circularReveal,
      //   duration: kTransitionDuration,
      // );

      context.go(AppRouter.homeViewPath);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: .stretch,
      children: [
        AnimatedLogo(
          controller: _controller,
          logoOpacity: _logoOpacity,
          logoScale: _logoScale,
        ),
        const Gap(10),
        AnimatedText(
          controller: _controller,
          textOpacity: _textOpacity,
          textSlide: _textSlide,
        ),
      ],
    );
  }
}
