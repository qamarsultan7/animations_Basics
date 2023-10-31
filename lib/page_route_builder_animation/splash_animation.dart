import 'dart:async';

import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> pagerouteAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    pagerouteAnimation = Tween<double>(begin: 1, end: 10).animate(_controller);

    _controller.addListener(() {
      if (_controller.isCompleted) {
        Navigator.of(context)
            .push(MycustomTransition(route: const Destination()));
        Timer(const Duration(milliseconds: 200), () {
          _controller.reset();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.forward();
          },
          child: ScaleTransition(
            scale: pagerouteAnimation,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              // child: Container(
              //   decoration: const BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: Colors.blue,
              //   ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Go Back'),
      ),
    );
  }
}

class MycustomTransition extends PageRouteBuilder {
  final Widget route;
  MycustomTransition({required this.route})
      : super(
          pageBuilder: (context, animation, secondryAnimation) {
            return route;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween =
                Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
                    .animate(animation);
            return SlideTransition(
              position: tween,
              child: child,
            );
          },
        );
}
