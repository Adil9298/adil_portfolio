import 'dart:ui';

import 'package:adil_portfolio/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen>
    with TickerProviderStateMixin {

  late AnimationController
  _paintController;

  late AnimationController
  _logoController;

  late Animation<double>
  _paintOpacity;

  late Animation<double>
  _paintScale;

  late Animation<double>
  _logoOpacity;

  late Animation<double>
  _logoScale;

  late Animation<double>
  _glowOpacity;

  @override
  void initState() {

    WidgetsBinding.instance
        .addPostFrameCallback((_) {

      precacheImage(
        const AssetImage(
          "assets/images/ma_logo.png",
        ),
        context,
      );
    });

    super.initState();

    /// PAINT EFFECT
    _paintController =
        AnimationController(
          vsync: this,
          duration:
          const Duration(
              milliseconds: 1800),
        );

    /// LOGO ANIMATION
    _logoController =
        AnimationController(
          vsync: this,
          duration:
          const Duration(
              milliseconds: 1600),
        );

    _paintOpacity =
        Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: _paintController,
            curve: Curves.easeOut,
          ),
        );

    _paintScale =
        Tween<double>(
          begin: 1.4,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: _paintController,
            curve:
            Curves.easeOutExpo,
          ),
        );

    _logoOpacity =
        Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: _logoController,
            curve:
            Curves.easeOutCubic,
          ),
        );

    _logoScale =
        Tween<double>(
          begin: .7,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: _logoController,
            curve:
            Curves.easeOutBack,
          ),
        );

    _glowOpacity =
        Tween<double>(
          begin: 0,
          end: .35,
        ).animate(
          CurvedAnimation(
            parent: _logoController,
            curve:
            Curves.easeOut,
          ),
        );

    startAnimation();
  }

  Future<void> startAnimation() async {

    await _paintController.forward();

    await Future.delayed(
      const Duration(
          milliseconds: 300),
    );

    await _logoController.forward();

    await Future.delayed(
      const Duration(
          milliseconds: 1200),
    );

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,

      PageRouteBuilder(

        transitionDuration:
        const Duration(
            milliseconds: 1400),

        reverseTransitionDuration:
        const Duration(
            milliseconds: 900),

        pageBuilder:
            (
            context,
            animation,
            secondaryAnimation,
            ) {

          return const HomeScreen();
        },

        transitionsBuilder:
            (
            context,
            animation,
            secondaryAnimation,
            child,
            ) {

          final fade =
          CurvedAnimation(
            parent: animation,
            curve:
            Curves.easeOutExpo,
          );

          final slide =
          Tween<Offset>(
            begin:
            const Offset(
                0, .08),

            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve:
              Curves.easeOutCubic,
            ),
          );

          final scale =
          Tween<double>(
            begin: 1.03,
            end: 1,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve:
              Curves.easeOutExpo,
            ),
          );

          return FadeTransition(
            opacity: fade,

            child: SlideTransition(
              position: slide,

              child: ScaleTransition(
                scale: scale,
                child: child,
              ),
            ),
          );
        },
      ),

          (route) => false,
    );
  }

  @override
  void dispose() {

    _paintController.dispose();

    _logoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      Colors.black,

      body: Stack(
        children: [

          /// BACKGROUND TEXTURE
          Positioned.fill(
            child: Container(
              decoration:
              const BoxDecoration(
                gradient:
                RadialGradient(
                  radius: 1.4,

                  colors: [

                    Color(
                        0xff101010),

                    Color(
                        0xff050505),

                    Colors.black,
                  ],
                ),
              ),
            ),
          ),

          /// TOP GLOW
          Positioned(
            top: -200,
            left: -150,

            child: AnimatedBuilder(
              animation:
              _logoController,

              builder:
                  (
                  context,
                  child,
                  ) {

                return Opacity(
                  opacity:
                  _glowOpacity
                      .value,

                  child: Container(
                    width: 450,
                    height: 450,

                    decoration:
                    BoxDecoration(
                      shape:
                      BoxShape
                          .circle,

                      color:
                      const Color(
                          0xffD4AF37)
                          .withValues(
                          alpha:
                          .12),
                    ),
                  ),
                );
              },
            ),
          ),

          /// BOTTOM GLOW
          Positioned(
            bottom: -250,
            right: -200,

            child: AnimatedBuilder(
              animation:
              _logoController,

              builder:
                  (
                  context,
                  child,
                  ) {

                return Opacity(
                  opacity:
                  _glowOpacity
                      .value,

                  child: Container(
                    width: 500,
                    height: 500,

                    decoration:
                    BoxDecoration(
                      shape:
                      BoxShape
                          .circle,

                      color:
                      const Color(
                          0xffD4AF37)
                          .withValues(
                          alpha:
                          .08),
                    ),
                  ),
                );
              },
            ),
          ),

          /// PAINTING TEXTURE
          Center(
            child: AnimatedBuilder(
              animation:
              _paintController,

              builder:
                  (
                  context,
                  child,
                  ) {

                return Transform.scale(
                  scale:
                  _paintScale
                      .value,

                  child: Opacity(
                    opacity:
                    _paintOpacity
                        .value,

                    child: Container(
                      width: 320,
                      height: 320,

                      decoration:
                      BoxDecoration(
                        shape:
                        BoxShape
                            .circle,

                        gradient:
                        RadialGradient(
                          colors: [

                            const Color(
                                0xffD4AF37)
                                .withValues(
                                alpha:
                                .16),

                            const Color(
                                0xffD4AF37)
                                .withValues(
                                alpha:
                                .06),

                            Colors
                                .transparent,
                          ],
                        ),
                      ),

                      child:
                      BackdropFilter(
                        filter:
                        ImageFilter
                            .blur(
                          sigmaX:
                          80,
                          sigmaY:
                          80,
                        ),

                        child:
                        const SizedBox(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          /// LOGO
          Center(
            child: AnimatedBuilder(
              animation:
              _logoController,

              builder:
                  (
                  context,
                  child,
                  ) {

                return Transform.scale(
                  scale:
                  _logoScale
                      .value,

                  child: Opacity(
                    opacity:
                    _logoOpacity
                        .value,

                    child: Container(
                      height: 240,
                      width: 240,

                      decoration:
                      BoxDecoration(
                        shape:
                        BoxShape
                            .circle,

                        boxShadow: [

                          BoxShadow(
                            color:
                            const Color(
                                0xffD4AF37)
                                .withValues(
                                alpha:
                                .25),

                            blurRadius:
                            80,

                            spreadRadius:
                            10,
                          ),
                        ],
                      ),

                      child: Image.asset(
                      "assets/images/ma_logo.png",

                      fit: BoxFit.contain,

                      filterQuality: FilterQuality.high,
                    ),
                    ),
                  ),
                );
              },
            ),
          ),

          /// PAINT DUST
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter:
                DustPainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DustPainter extends CustomPainter {

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {

    final paint = Paint()
      ..color = const Color(
          0xffD4AF37)
          .withValues(alpha: .08);

    for (int i = 0; i < 120; i++) {

      final dx =
          (i * 37.0) %
              size.width;

      final dy =
          (i * 53.0) %
              size.height;

      canvas.drawCircle(
        Offset(dx, dy),
        (i % 4) + .5,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant CustomPainter oldDelegate,
      ) {
    return false;
  }
}