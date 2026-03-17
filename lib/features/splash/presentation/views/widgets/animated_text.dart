import 'package:flutter/material.dart';
import 'package:test2/core/utils/styles.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    super.key,
    required AnimationController controller,
    required Animation<double> textOpacity,
    required Animation<Offset> textSlide,
  }) : _controller = controller,
       _textOpacity = textOpacity,
       _textSlide = textSlide;

  final AnimationController _controller;
  final Animation<double> _textOpacity;
  final Animation<Offset> _textSlide;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _textOpacity.value,
          child: SlideTransition(position: _textSlide, child: child),
        );
      },
      child: Center(
        child: const Text('Discover the world here', style: Styles.style15),
      ),
    );
  }
}
