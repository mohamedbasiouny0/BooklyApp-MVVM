import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test2/core/utils/assets.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    super.key,
    required AnimationController controller,
    required Animation<double> logoOpacity,
    required Animation<double> logoScale,
  }) : _controller = controller,
       _logoOpacity = logoOpacity,
       _logoScale = logoScale;

  final AnimationController _controller;
  final Animation<double> _logoOpacity;
  final Animation<double> _logoScale;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _logoOpacity.value,
          child: Transform.scale(scale: _logoScale.value, child: child),
        );
      },
      child: SvgPicture.asset(Assets.logo, height: 45),
    );
  }
}