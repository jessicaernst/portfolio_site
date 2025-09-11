import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  AnimatedBackgroundState createState() => AnimatedBackgroundState();
}

class AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  int _alpha(double v) => (v * 255).toInt();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.9, -0.6),
              end: Alignment(1.0, 0.8),
              colors: [
                Color(0xFF2B5C64),
                Color(0xFF335C6A),
                Color(0xFF8A6B53),
              ],
            ),
          ),
        ),
        Positioned(
          top: 120, // Direkt unter der Navbar (72px + 48px spacing)
          left: -mq.size.width * 0.05, // Links angeschnitten
          right: -mq.size.width * 0.05, // Rechts angeschnitten
          child: IgnorePointer(
            child: Center(
              child: Opacity(
                opacity: 0.06,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Haupttext ohne "i" Punkt
                    Text(
                      'APPDEV',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: mq.size.width * 0.25,
                        fontWeight: FontWeight.w800,
                        height: 164.3 / 264.26,
                        letterSpacing: mq.size.width * 0.008,
                        color: Colors.white,
                      ),
                    ),
                    // Switch Button als "i" Punkt
                    Positioned(
                      right: mq.size.width * 0.18, // Position über dem "i"
                      top: -mq.size.width * 0.04,
                      child: Container(
                        width: mq.size.width * 0.035,
                        height: mq.size.width * 0.018,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(mq.size.width * 0.009),
                          color: Colors.lightBlue[100]?.withAlpha((0.8 * 255).toInt()),
                          border: Border.all(
                            color: Colors.white.withAlpha((0.4 * 255).toInt()),
                            width: 1.5,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: mq.size.width * 0.014,
                            height: mq.size.width * 0.014,
                            margin: EdgeInsets.all(mq.size.width * 0.002),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha((0.15 * 255).toInt()),
                                  blurRadius: 3,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        RepaintBoundary(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, _) {
              final a = _animation.value;
              return Stack(
                children: [
                  Positioned(
                    top: 80 + 30 * math.sin(a),
                    right: -80,
                    child: IgnorePointer(
                      child: Container(
                        width: 320,
                        height: 320,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            center: const Alignment(-0.2, -0.4),
                            radius: 0.9,
                            colors: [
                              Colors.white.withAlpha(_alpha(0.06)),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60 + 40 * math.cos(a),
                    left: -120,
                    child: IgnorePointer(
                      child: Container(
                        width: 420,
                        height: 420,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            center: const Alignment(0.0, 0.0),
                            radius: 0.9,
                            colors: [
                              Colors.white.withAlpha(_alpha(0.04)),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}