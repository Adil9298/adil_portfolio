import 'dart:math';
import 'dart:typed_data';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RoleModel {
  final String title;
  final String subtitle;
  final String gifPath;

  RoleModel({
    required this.title,
    required this.subtitle,
    required this.gifPath,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: .78);

  int currentIndex = 0;

  final ScrollController _scrollController = ScrollController();

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  final List<RoleModel> roles = [
    RoleModel(
      title: "Flutter Developer",
      subtitle: "Building premium cross-platform experiences.",
      gifPath: "assets/gif/developer-gif.gif",
    ),
    RoleModel(
      title: "Data Scientist",
      subtitle: "Turning data into intelligent systems.",
      gifPath: "assets/gif/scientist-gif.gif",
    ),
  ];

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final isMobile = width < 700;
    final isTablet = width >= 700 && width < 1100;

    return Scaffold(
      body: Stack(
        children: [
          /// MAIN DARK BACKGROUND
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff000000),
                    Color(0xff050505),
                    Color(0xff080808),
                    Color(0xff000000),
                  ],
                ),
              ),
            ),
          ),

          /// TOP LEFT GOLD GLOW
          Positioned(
            top: -250,
            left: -180,
            child: Container(
              width: 550,
              height: 550,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffD4AF37).withValues(alpha: .05),
              ),
            ),
          ),

          /// BOTTOM RIGHT GOLD GLOW
          Positioned(
            bottom: -300,
            right: -250,
            child: Container(
              width: 700,
              height: 700,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffD4AF37).withValues(alpha: .04),
              ),
            ),
          ),

          /// CENTER GOLD DEPTH
          Positioned(
            top: 250,
            left: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffD4AF37).withValues(alpha: .025),
              ),
            ),
          ),

          /// PARTICLES
          const AnimatedBackground(),

          /// VIGNETTE EFFECT
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1.25,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: .82),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 60,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    _buildNavbar(isMobile),

                    SizedBox(height: isMobile ? 10 : 30),

                    Container(
                      key: homeKey,
                      child: isMobile
                          ? _buildMobileLayout()
                          : _buildDesktopLayout(isTablet),
                    ),

                    const SizedBox(height: 100),

                    Container(
                      key: servicesKey,
                      child: _buildServicesSection(),
                    ),

                    const SizedBox(height: 100),

                    Container(
                      key: skillsKey,
                      child: _buildSkillsSection(),
                    ),

                    const SizedBox(height: 100),

                    Container(
                      key: experienceKey,
                      child: _buildExperienceSection(),
                    ),

                    const SizedBox(height: 100),

                    Container(
                      key: projectsKey,
                      child: _buildProjectsSection(),
                    ),

                    const SizedBox(height: 100),

                    Container(
                      key: contactKey,
                      child: _buildContactSection(),
                    ),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection() {

    return Column(
      children: [

        sectionTitle("Experience"),

        const SizedBox(height: 50),

        Wrap(
          spacing: 30,
          runSpacing: 30,
          alignment: WrapAlignment.center,
          children: [

            experienceCard(
              year: "2024 - Present",
              title: "Flutter Developer",
              subtitle:
              "Building scalable Flutter applications with Firebase, Riverpod and premium UI systems.",
            ),

            experienceCard(
              year: "2023 - Present",
              title: "Data Scientist",
              subtitle:
              "Working on AI systems, machine learning workflows and intelligent analytics platforms.",
            ),
          ],
        ),
      ],
    );
  }

  Widget experienceCard({
    required String year,
    required String title,
    required String subtitle,
  }) {

    return Container(
      width: 400,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xffD4AF37)
              .withValues(alpha: .4),
        ),
        color: const Color(0xff050505),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffD4AF37)
                .withValues(alpha: .12),
            blurRadius: 30,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          Text(
            year,
            style: const TextStyle(
              color: Color(0xffD4AF37),
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            subtitle,
            style: TextStyle(
              color: Colors.white.withValues(alpha: .7),
              height: 1.8,
            ),
          ),
        ],
      ),
    )
        .animate()
        .fade()
        .slideY(
      begin: .2,
      end: 0,
    );
  }

  PopupMenuItem<String> popupItem(String title) {

    return PopupMenuItem<String>(
      value: title,
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xffD4AF37),
        ),
      ),
    );
  }

  Widget _buildNavbar(bool isMobile) {

    final isTablet =
        MediaQuery.of(context).size.width < 1100;

    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: isMobile

      /// MOBILE NAVBAR
          ? Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [

          Expanded(
            child: ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  colors: [
                    Color(0xffFFF2B0),
                    Color(0xffD4AF37),
                  ],
                ).createShader(bounds);
              },
              child: const Text(
                "MOHAMMED ADIL. K",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),

          PopupMenuButton<String>(
            color: const Color(0xff050505),
            icon: const Icon(
              Icons.menu_rounded,
              color: Color(0xffD4AF37),
            ),
            onSelected: (value) {

              switch(value) {

                case "Home":
                  scrollToSection(homeKey);
                  break;

                case "Services":
                  scrollToSection(servicesKey);
                  break;

                case "Skills":
                  scrollToSection(skillsKey);
                  break;

                case "Experience":
                  scrollToSection(experienceKey);
                  break;

                case "Projects":
                  scrollToSection(projectsKey);
                  break;

                case "Contact":
                  scrollToSection(contactKey);
                  break;
              }
            },
            itemBuilder: (context) => [

              popupItem("Home"),
              popupItem("Services"),
              popupItem("Skills"),
              popupItem("Experience"),
              popupItem("Projects"),
              popupItem("Contact"),
            ],
          ),
        ],
      )

      /// DESKTOP/TABLET NAVBAR
          : Column(
        children: [

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              Expanded(
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [
                        Color(0xffFFF2B0),
                        Color(0xffD4AF37),
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    "MOHAMMED ADIL. K",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isTablet ? 22 : 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 30),

              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      navButton(
                        "Home",
                            () => scrollToSection(homeKey),
                      ),

                      navButton(
                        "Services",
                            () => scrollToSection(servicesKey),
                      ),

                      navButton(
                        "Skills",
                            () => scrollToSection(skillsKey),
                      ),

                      navButton(
                        "Experience",
                            () => scrollToSection(experienceKey),
                      ),

                      navButton(
                        "Projects",
                            () => scrollToSection(projectsKey),
                      ),

                      navButton(
                        "Contact",
                            () => scrollToSection(contactKey),
                      ),
                    ],
                  ),
                ),
              ),

              // Flexible(
              //   child: Wrap(
              //     alignment: WrapAlignment.end,
              //     runSpacing: 12,
              //     spacing: 4,
              //     children: [
              //
              //       navButton(
              //         "Home",
              //             () => scrollToSection(homeKey),
              //       ),
              //
              //       navButton(
              //         "Services",
              //             () => scrollToSection(servicesKey),
              //       ),
              //
              //       navButton(
              //         "Skills",
              //             () => scrollToSection(skillsKey),
              //       ),
              //
              //       navButton(
              //         "Experience",
              //             () => scrollToSection(experienceKey),
              //       ),
              //
              //       navButton(
              //         "Projects",
              //             () => scrollToSection(projectsKey),
              //       ),
              //
              //       navButton(
              //         "Contact",
              //             () => scrollToSection(contactKey),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection() {

    return Column(
      children: [

        sectionTitle("Services"),

        const SizedBox(height: 20),

        Text(
          "Premium solutions crafted with Flutter & AI",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withValues(alpha: .7),
            fontSize: 18,
            height: 1.8,
          ),
        ),

        const SizedBox(height: 60),

        Wrap(
          spacing: 30,
          runSpacing: 30,
          alignment: WrapAlignment.center,
          children: [

            serviceCard(
              icon: Icons.phone_android_rounded,
              title: "Flutter App Development",
              subtitle:
              "Cross-platform mobile applications with premium UI, responsive architecture and scalable performance.",
            ),

            serviceCard(
              icon: Icons.web_rounded,
              title: "Web App Development",
              subtitle:
              "Modern responsive Flutter web applications with animations, admin dashboards and business systems.",
            ),

            serviceCard(
              icon: Icons.auto_graph_rounded,
              title: "Data Science Solutions",
              subtitle:
              "AI-driven analytics, prediction systems, machine learning workflows and intelligent automation.",
            ),

            serviceCard(
              icon: Icons.dashboard_customize_rounded,
              title: "Admin Dashboard Systems",
              subtitle:
              "Professional admin panels with Firebase, analytics, reports, role management and real-time systems.",
            ),

            serviceCard(
              icon: Icons.cloud_done_rounded,
              title: "Firebase Integration",
              subtitle:
              "Authentication, Firestore, notifications, cloud functions and complete backend architecture.",
            ),

            serviceCard(
              icon: Icons.animation_rounded,
              title: "Premium UI/UX Design",
              subtitle:
              "Luxury-level cinematic interfaces with smooth animations, futuristic interactions and modern UX.",
            ),
          ],
        ),
      ],
    );
  }

  Widget serviceCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {

    bool hovered = false;

    return StatefulBuilder(
      builder: (context, setState) {

        return MouseRegion(
          onEnter: (_) {
            setState(() {
              hovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              hovered = false;
            });
          },

          child: AnimatedContainer(
            duration: 400.ms,
            width: 340,
            padding: const EdgeInsets.all(28),

            transform: Matrix4.identity()
              ..translate(
                0.0,
                hovered ? -12.0 : 0.0,
              ),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),

              border: Border.all(
                color: const Color(0xffD4AF37)
                    .withValues(alpha: hovered ? .8 : .35),
              ),

              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [

                  hovered
                      ? const Color(0xff101010)
                      : const Color(0xff050505),

                  Colors.black,
                ],
              ),

              boxShadow: hovered
                  ? [
                BoxShadow(
                  color: const Color(0xffD4AF37)
                      .withValues(alpha: .25),
                  blurRadius: 35,
                  spreadRadius: 2,
                ),
              ]
                  : [],
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                AnimatedContainer(
                  duration: 300.ms,
                  height: 72,
                  width: 72,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    gradient: LinearGradient(
                      colors: [

                        const Color(0xffD4AF37)
                            .withValues(alpha: .25),

                        const Color(0xff8B6B1F)
                            .withValues(alpha: .12),
                      ],
                    ),

                    boxShadow: hovered
                        ? [
                      BoxShadow(
                        color: const Color(0xffD4AF37)
                            .withValues(alpha: .3),
                        blurRadius: 25,
                      ),
                    ]
                        : [],
                  ),

                  child: Icon(
                    icon,
                    color: const Color(0xffD4AF37),
                    size: 34,
                  ),
                ),

                const SizedBox(height: 28),

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 18),

                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: .7),
                    height: 1.8,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    )
        .animate()
        .fade()
        .slideY(
      begin: .2,
      end: 0,
    );
  }

  Widget navButton(String text, VoidCallback onTap) {
    bool hovered = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              hovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              hovered = false;
            });
          },
          child: GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              duration: 300.ms,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: hovered
                    ? const Color(0xffD4AF37).withValues(alpha: .12)
                    : Colors.transparent,
                border: Border.all(
                  color: hovered
                      ? const Color(0xffD4AF37)
                      : Colors.transparent,
                ),
                boxShadow: hovered
                    ? [
                  BoxShadow(
                    color: const Color(0xffD4AF37)
                        .withValues(alpha: .25),
                    blurRadius: 20,
                  ),
                ]
                    : [],
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: hovered
                      ? const Color(0xffD4AF37)
                      : Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// MOBILE
  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hey There 👋",
          style: TextStyle(
            color: Colors.white.withValues(alpha: .9),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ).animate().fade().slideX(),

        const SizedBox(height: 30),

        _buildCards(),

        const SizedBox(height: 40),

        _buildTexts(true),
      ],
    );
  }

  /// DESKTOP
  Widget _buildDesktopLayout(bool isTablet) {
    return SizedBox(
      height: isTablet ? 650 : 700,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Align(alignment: Alignment.centerLeft, child: _buildCards()),
          ),

          const SizedBox(width: 50),

          Expanded(flex: 4, child: _buildTexts(false)),
        ],
      ),
    );
  }

  Widget _buildCards() {
    return SizedBox(
      height: 550,
      child: PageView.builder(
        controller: _pageController,
        itemCount: roles.length,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemBuilder: (context, index) {
          final role = roles[index];

          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1;

              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - (value.abs() * .2)).clamp(.0, 1.0);
              }

              return Transform.scale(
                scale: value,
                child: Transform.rotate(
                  angle: (index - currentIndex) * .05,
                  child: child,
                ),
              );
            },
            child: Center(
              child: HoverTiltCard(
                child: SizedBox(
                  width: 320,
                  height: 470,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      /// FLAME AURA
                      Positioned(
                        bottom: 10,
                        child:
                            Container(
                                  width: 240,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        const Color(
                                          0xffD4AF37,
                                        ).withValues(alpha: .0),
                                        const Color(
                                          0xffD4AF37,
                                        ).withValues(alpha: .08),
                                        const Color(
                                          0xffFFB300,
                                        ).withValues(alpha: .22),
                                        const Color(
                                          0xffFF6A00,
                                        ).withValues(alpha: .18),
                                      ],
                                    ),
                                  ),
                                )
                                .animate(
                                  onPlay: (controller) =>
                                      controller.repeat(reverse: true),
                                )
                                .scaleXY(
                                  begin: 1,
                                  end: 1.08,
                                  duration: 2.seconds,
                                )
                                .fade(begin: .65, end: 1, duration: 2.seconds),
                      ),

                      /// OUTER GLOW
                      Positioned(
                        bottom: 35,
                        child: Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(
                              0xffD4AF37,
                            ).withValues(alpha: .10),
                          ),
                        ),
                      ),

                      /// MAIN CARD
                      Positioned(
                        bottom: 0,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(34),
                          ),
                          child: Container(
                            width: 270,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(34),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xff050505),
                                  const Color(0xff000000),
                                ],
                              ),
                              border: Border.all(
                                color: const Color(
                                  0xffD4AF37,
                                ).withValues(alpha: .85),
                                width: 1.4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xffD4AF37,
                                  ).withValues(alpha: .18),
                                  blurRadius: 30,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                /// INNER GOLD LIGHT
                                Positioned(
                                  top: -40,
                                  right: -40,
                                  child: Container(
                                    width: 140,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(
                                        0xffD4AF37,
                                      ).withValues(alpha: .07),
                                    ),
                                  ),
                                ),

                                /// BOTTOM FLAME
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(34),
                                      bottomRight: Radius.circular(34),
                                    ),
                                    child: Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            const Color(0xffD4AF37)
                                                .withValues(alpha: .0),

                                            const Color(0xffD4AF37)
                                                .withValues(alpha: .08),

                                            const Color(0xffFFB300)
                                                .withValues(alpha: .16),

                                            const Color(0xffFF6A00)
                                                .withValues(alpha: .14),
                                          ],
                                        ),
                                      ),
                                    )
                                        .animate(
                                      onPlay: (controller) =>
                                          controller.repeat(reverse: true),
                                    )
                                        .moveY(
                                      begin: 0,
                                      end: 8,
                                      duration: 2.seconds,
                                    ),
                                  ),
                                ),

                                /// CONTENT
                                Positioned(
                                  bottom: 30,
                                  left: 22,
                                  right: 22,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        role.title,
                                        style: const TextStyle(
                                          color: Color(0xffD4AF37),
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 12),

                                      Text(
                                        role.subtitle,
                                        style: TextStyle(
                                          color: Colors.white.withValues(
                                            alpha: .72,
                                          ),
                                          height: 1.6,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      /// HERO GIF
                      Positioned(
                        top: 25,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 350),
                          transitionBuilder:
                              (child, animation) {

                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: HeroImage(
                            key: ValueKey(currentIndex),
                            image: role.gifPath,
                          ),
                        ),
                      ),

                      /// LEFT BUTTON
                      if (currentIndex > 0)
                        Positioned(
                          left: 0,
                          top: 130,
                          child: roleSwitchButton(
                            Icons.arrow_back_ios_new_rounded,
                                () {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),

                      /// RIGHT BUTTON
                      if (currentIndex < roles.length - 1)
                        Positioned(
                          right: 0,
                          top: 130,
                          child: roleSwitchButton(
                            Icons.arrow_forward_ios_rounded,
                                () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget roleSwitchButton(
      IconData icon,
      VoidCallback onTap,
      ) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withValues(alpha: .6),
          border: Border.all(
            color: const Color(0xffD4AF37)
                .withValues(alpha: .7),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffD4AF37)
                  .withValues(alpha: .25),
              blurRadius: 20,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: const Color(0xffD4AF37),
          size: 20,
        ),
      ),
    )
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .scaleXY(
      begin: 1,
      end: 1.08,
      duration: 2.seconds,
    );
  }

  Widget _buildTexts(bool isMobile) {
    final role = roles[currentIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(!isMobile)
        Text(
          "Hey There 👋",
          style: TextStyle(
            color: Colors.white.withValues(alpha: .85),
            fontSize: 22,
          ),
        ).animate().fade().slideY(),

        if(!isMobile)
        const SizedBox(height: 20),

        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [Color(0xffF7E7A1), Color(0xffD4AF37)],
            ).createShader(bounds);
          },
          child: const Text(
            "I'm Adil",
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1,
            ),
          ),
        ).animate().fade().slideX(),

        const SizedBox(height: 20),

        AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText(
              role.title,
              speed: const Duration(milliseconds: 80),
              textStyle: const TextStyle(
                color: Color(0xffD4AF37),
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        const SizedBox(height: 25),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Text(
            role.subtitle,
            key: ValueKey(role.subtitle),
            style: TextStyle(
              color: Colors.white.withValues(alpha: .75),
              fontSize: 18,
              height: 1.8,
            ),
          ),
        ),

        const SizedBox(height: 40),

        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            PremiumButton(title: "View Projects", filled: true,onTap: () => scrollToSection(projectsKey),),

            PremiumButton(title: "Download Resume", filled: false, onTap: () {},),
          ],
        ),
      ],
    );
  }

  Widget _buildSkillsSection() {
    final skills = [
      "Flutter",
      "Firebase",
      "Riverpod",
      "Python",
      "TensorFlow",
      "Machine Learning",
      "Dart",
      "OpenCV",
      "AI",
      "Deep Learning",
    ];

    return Column(
      children: [
        sectionTitle("Skills"),

        const SizedBox(height: 40),

        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: skills.map((e) => SkillChip(skill: e)).toList(),
        ),
      ],
    );
  }

  Widget _buildProjectsSection() {
    return Column(
      children: [
        sectionTitle("Featured Projects"),

        const SizedBox(height: 50),

        LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 800;

            return Wrap(
              spacing: 30,
              runSpacing: 30,
              alignment: WrapAlignment.center,
              children: List.generate(
                3,
                (index) => ProjectCard(isMobile: isMobile),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildContactSection() {
    return Column(
      children: [
        sectionTitle("Contact"),

        const SizedBox(height: 40),

        Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: const Color(0xffD4AF37).withValues(alpha: .4),
            ),
            color: const Color(0xff080808),
          ),
          child: Column(
            children: [
              Text(
                "Let's build something amazing together.",
                style: TextStyle(
                  color: Colors.white.withValues(alpha: .8),
                  fontSize: 22,
                ),
              ),

              const SizedBox(height: 25),

              Wrap(
                spacing: 20,
                children: [
                  socialButton(Icons.email),
                  socialButton(Icons.code),
                  socialButton(Icons.camera_alt),
                  socialButton(Icons.business),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget socialButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xffD4AF37).withValues(alpha: .5),
        ),
      ),
      child: Icon(icon, color: const Color(0xffD4AF37)),
    );
  }

  Widget sectionTitle(String title) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [Color(0xffFFF2B0), Color(0xffD4AF37)],
        ).createShader(bounds);
      },
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class HeroImage extends StatefulWidget {
  final String image;

  const HeroImage({
    super.key,
    required this.image,
  });

  @override
  State<HeroImage> createState() =>
      _HeroImageState();
}

class _HeroImageState
    extends State<HeroImage> {

  Uint8List? bytes;

  @override
  void initState() {
    super.initState();

    loadGif();
  }

  Future<void> loadGif() async {

    final data =
    await rootBundle.load(widget.image);

    setState(() {
      bytes = data.buffer.asUint8List();
    });
  }

  @override
  Widget build(BuildContext context) {

    if (bytes == null) {
      return const SizedBox(
        height: 240,
        width: 220,
      );
    }

    return Container(
      height: 240,
      width: 220,
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(30),
      ),

      child: ClipRRect(
        borderRadius:
        BorderRadius.circular(30),

        child: Image.memory(
          bytes!,
          fit: BoxFit.contain,
          gaplessPlayback: false,
        ),
      ),
    )
        .animate(
      onPlay: (controller) =>
          controller.repeat(reverse: true),
    )
        .moveY(
      begin: -8,
      end: 8,
      duration: 3.seconds,
    );
  }
}

// class HeroImage extends StatefulWidget {
//   final String image;
//
//   const HeroImage({super.key, required this.image});
//
//   @override
//   State<HeroImage> createState() => _HeroImageState();
// }
//
// class _HeroImageState extends State<HeroImage> {
//   late String imagePath;
//
//   @override
//   void initState() {
//     super.initState();
//
//     /// force browser refresh
//     imagePath = "${widget.image}?v=${DateTime.now().millisecondsSinceEpoch}";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//           height: 300,
//           width: 250,
//           decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(30),
//             child: Image.network(
//               imagePath,
//               fit: BoxFit.contain,
//               gaplessPlayback: false,
//             ),
//           ),
//         )
//         .animate(onPlay: (controller) => controller.repeat(reverse: true))
//         .moveY(begin: -8, end: 8, duration: 3.seconds);
//   }
// }

class PremiumButton extends StatefulWidget {
  final String title;
  final bool filled;
  final VoidCallback onTap;

  const PremiumButton({super.key, required this.title, required this.filled, required this.onTap});

  @override
  State<PremiumButton> createState() => _PremiumButtonState();
}

class _PremiumButtonState extends State<PremiumButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: 300.ms,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: widget.filled
                ? const LinearGradient(
                    colors: [Color(0xffD4AF37), Color(0xff8B6B1F)],
                  )
                : null,
            border: Border.all(color: const Color(0xffD4AF37)),
            boxShadow: hovered
                ? [
                    BoxShadow(
                      color: const Color(0xffD4AF37).withValues(alpha: .4),
                      blurRadius: 20,
                    ),
                  ]
                : [],
          ),
          transform: Matrix4.identity()..scale(hovered ? 1.05 : 1.0),
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.filled ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class SkillChip extends StatefulWidget {
  final String skill;

  const SkillChip({super.key, required this.skill});

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: 300.ms,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: const Color(0xffD4AF37).withValues(alpha: .6),
          ),
          color: hovered
              ? const Color(0xffD4AF37).withValues(alpha: .15)
              : const Color(0xff050505),
          boxShadow: hovered
              ? [
                  BoxShadow(
                    color: const Color(0xffD4AF37).withValues(alpha: .3),
                    blurRadius: 20,
                  ),
                ]
              : [],
        ),
        child: Text(widget.skill, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final bool isMobile;

  const ProjectCard({super.key, required this.isMobile});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: 400.ms,
        width: widget.isMobile ? double.infinity : 360,
        padding: const EdgeInsets.all(24),
        transform: Matrix4.identity()..translate(0.0, hovered ? -10.0 : 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: const Color(0xffD4AF37).withValues(alpha: .5),
          ),
          color: const Color(0xff050505),
          boxShadow: hovered
              ? [
                  BoxShadow(
                    color: const Color(0xffD4AF37).withValues(alpha: .25),
                    blurRadius: 30,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xffD4AF37).withValues(alpha: .2),
                    Colors.black,
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Premium Portfolio",
              style: TextStyle(
                color: Color(0xffD4AF37),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "A fully animated futuristic Flutter portfolio experience.",
              style: TextStyle(
                color: Colors.white.withValues(alpha: .7),
                height: 1.7,
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 10,
              children: [
                miniTag("Flutter"),
                miniTag("Firebase"),
                miniTag("AI"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget miniTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xffD4AF37).withValues(alpha: .1),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Color(0xffD4AF37), fontSize: 12),
      ),
    );
  }
}

class HoverTiltCard extends StatefulWidget {
  final Widget child;

  const HoverTiltCard({super.key, required this.child});

  @override
  State<HoverTiltCard> createState() => _HoverTiltCardState();
}

class _HoverTiltCardState extends State<HoverTiltCard> {
  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        final size = MediaQuery.of(context).size;

        setState(() {
          x = (event.position.dy - size.height / 2) / 50;
          y = -(event.position.dx - size.width / 2) / 50;
        });
      },
      onExit: (_) {
        setState(() {
          x = 0;
          y = 0;
        });
      },
      child: AnimatedContainer(
        duration: 200.ms,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(x * pi / 180)
          ..rotateY(y * pi / 180),
        child: widget.child,
      ),
    );
  }
}

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(25, (index) {
        final random = Random();

        final left = random.nextDouble() * 1400;
        final top = random.nextDouble() * 2000;

        return Positioned(
          left: left,
          top: top,
          child:
              Container(
                    width: random.nextDouble() * 4 + 2,
                    height: random.nextDouble() * 4 + 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xffD4AF37).withValues(alpha: .4),
                    ),
                  )
                  .animate(onPlay: (controller) => controller.repeat())
                  .moveY(
                    begin: 0,
                    end: -20,
                    duration: Duration(seconds: random.nextInt(4) + 3),
                  )
                  .fadeIn()
                  .fadeOut(),
        );
      }),
    );
  }
}
