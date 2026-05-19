import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 60,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    SizedBox(height: isMobile ? 10 : 30),

                    isMobile
                        ? _buildMobileLayout()
                        : _buildDesktopLayout(isTablet),

                    const SizedBox(height: 100),

                    _buildSkillsSection(),

                    const SizedBox(height: 100),

                    _buildProjectsSection(),

                    const SizedBox(height: 100),

                    _buildContactSection(),

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

  /// MOBILE
  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi There 👋",
          style: TextStyle(
            color: Colors.white.withValues(alpha: .9),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ).animate().fade().slideX(),

        const SizedBox(height: 30),

        _buildCards(),

        const SizedBox(height: 40),

        _buildTexts(),
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: _buildCards(),
            ),
          ),

          const SizedBox(width: 50),

          Expanded(
            flex: 4,
            child: _buildTexts(),
          ),
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
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    /// FLAME GLOW
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xffD4AF37)
                                  .withValues(alpha: .45),
                              blurRadius: 40,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                      )
                          .animate(onPlay: (controller) => controller.repeat())
                          .shimmer(
                        duration: 5.seconds,
                        color: Colors.white24,
                      ),
                    ),

                    /// CARD
                    Container(
                      width: 320,
                      height: 430,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xff050505),
                            const Color(0xff000000),
                          ],
                        ),
                        border: Border.all(
                          color: const Color(0xffD4AF37).withValues(alpha: .8),
                          width: 1.5,
                        ),
                      ),
                      child: Stack(
                        children: [
                          /// GOLD SHINE
                          Positioned(
                            top: -50,
                            right: -50,
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffD4AF37)
                                    .withValues(alpha: .08),
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 35,
                            left: 25,
                            right: 25,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
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
                                    color: Colors.white.withValues(alpha: .7),
                                    height: 1.6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// IMAGE
                    Positioned(
                      top: -60,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: HeroImage(
                          key: ValueKey(role.gifPath + currentIndex.toString()),
                          image: role.gifPath,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTexts() {
    final role = roles[currentIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hi There 👋",
          style: TextStyle(
            color: Colors.white.withValues(alpha: .85),
            fontSize: 22,
          ),
        ).animate().fade().slideY(),

        const SizedBox(height: 20),

        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [
                Color(0xffF7E7A1),
                Color(0xffD4AF37),
              ],
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
            PremiumButton(
              title: "View Projects",
              filled: true,
            ),

            PremiumButton(
              title: "Download Resume",
              filled: false,
            ),
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
          children: skills
              .map(
                (e) => SkillChip(skill: e),
          )
              .toList(),
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
                    (index) => ProjectCard(
                  isMobile: isMobile,
                ),
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
      child: Icon(
        icon,
        color: const Color(0xffD4AF37),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [
            Color(0xffFFF2B0),
            Color(0xffD4AF37),
          ],
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
  State<HeroImage> createState() => _HeroImageState();
}

class _HeroImageState extends State<HeroImage> {

  late String imagePath;

  @override
  void initState() {
    super.initState();

    /// force browser refresh
    imagePath =
    "${widget.image}?v=${DateTime.now().millisecondsSinceEpoch}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          imagePath,
          fit: BoxFit.contain,
          gaplessPlayback: false,
        ),
      ),
    )
        .animate(
      onPlay: (controller) => controller.repeat(reverse: true),
    )
        .moveY(
      begin: -8,
      end: 8,
      duration: 3.seconds,
    );
  }
}

class PremiumButton extends StatefulWidget {
  final String title;
  final bool filled;

  const PremiumButton({
    super.key,
    required this.title,
    required this.filled,
  });

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
      child: AnimatedContainer(
        duration: 300.ms,
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 18,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: widget.filled
              ? const LinearGradient(
            colors: [
              Color(0xffD4AF37),
              Color(0xff8B6B1F),
            ],
          )
              : null,
          border: Border.all(
            color: const Color(0xffD4AF37),
          ),
          boxShadow: hovered
              ? [
            BoxShadow(
              color: const Color(0xffD4AF37).withValues(alpha: .4),
              blurRadius: 20,
            ),
          ]
              : [],
        ),
        transform: Matrix4.identity()
          ..scale(
            hovered ? 1.05 : 1.0,
          ),
        child: Text(
          widget.title,
          style: TextStyle(
            color: widget.filled ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class SkillChip extends StatefulWidget {
  final String skill;

  const SkillChip({
    super.key,
    required this.skill,
  });

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
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 14,
        ),
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
        child: Text(
          widget.skill,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final bool isMobile;

  const ProjectCard({
    super.key,
    required this.isMobile,
  });

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
        transform: Matrix4.identity()
          ..translate(
            0.0,
            hovered ? -10.0 : 0.0,
          ),
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
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xffD4AF37).withValues(alpha: .1),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xffD4AF37),
          fontSize: 12,
        ),
      ),
    );
  }
}

class HoverTiltCard extends StatefulWidget {
  final Widget child;

  const HoverTiltCard({
    super.key,
    required this.child,
  });

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
      children: List.generate(
        25,
            (index) {
          final random = Random();

          final left = random.nextDouble() * 1400;
          final top = random.nextDouble() * 2000;

          return Positioned(
            left: left,
            top: top,
            child: Container(
              width: random.nextDouble() * 4 + 2,
              height: random.nextDouble() * 4 + 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffD4AF37).withValues(alpha: .4),
              ),
            )
                .animate(
              onPlay: (controller) => controller.repeat(),
            )
                .moveY(
              begin: 0,
              end: -20,
              duration: Duration(
                seconds: random.nextInt(4) + 3,
              ),
            )
                .fadeIn()
                .fadeOut(),
          );
        },
      ),
    );
  }
}