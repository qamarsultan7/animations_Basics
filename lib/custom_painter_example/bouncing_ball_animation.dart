import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  State<BouncingBallAnimation> createState() => _BouncingBallAnimationState();
}

class _BouncingBallAnimationState extends State<BouncingBallAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> customPainterAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    customPainterAnimation =
        Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
    customPainterAnimation.addStatusListener((status) {
      if (customPainterAnimation.isCompleted) {
        _controller.reverse();
      } else if (customPainterAnimation.isDismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) => CustomPaint(
                size: const Size(200, 200),
                painter: CustomBallPainter(
                    animationValue: customPainterAnimation.value),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomBallPainter extends CustomPainter {
  final double animationValue;
  CustomBallPainter({required this.animationValue});
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(size.width, size.height  - (animationValue * size.height)),
        50,
        Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
