import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../models/role_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController =
  PageController(viewportFraction: .78);

  int currentIndex = 0;

  final ScrollController _scrollController =
  ScrollController();

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();
  final GlobalKey certificationKey =
  GlobalKey();

  RoleModel get currentRole =>
      roles[currentIndex];

  final List<RoleModel> roles = [

    /// FLUTTER DEVELOPER
    RoleModel(
      title: "Flutter Developer",

      subtitle:
      "Engineering cinematic cross-platform ecosystems with premium UI, scalable architecture and production-grade performance.",

      summary:
      "Passionate Flutter developer with 3+ years of experience building premium mobile and web applications using Flutter, Firebase, Node.js and scalable cloud architectures. Specialized in crafting highly responsive, animated and production-ready systems with clean architecture, Riverpod, REST APIs and real-time backend integrations. Strong expertise in performance optimization, Firebase ecosystems, admin dashboard systems and futuristic UI engineering.",

      gifPath:
      "assets/gif/developer-gif.gif",

      certifications: [],

      services: [

        {
          "icon":
          Icons.phone_android_rounded,

          "title":
          "Flutter App Development",

          "subtitle":
          "High-performance Android, iOS and Web applications with scalable architecture and modern UI systems.",
        },

        {
          "icon":
          Icons.dashboard_customize_rounded,

          "title":
          "Admin Dashboard Systems",

          "subtitle":
          "Professional admin panels with analytics, reports, Firebase integration and real-time management.",
        },

        {
          "icon":
          Icons.cloud_done_rounded,

          "title":
          "Firebase Backend Integration",

          "subtitle":
          "Authentication, Firestore, cloud messaging, notifications and secure scalable backend architecture.",
        },

        {
          "icon":
          Icons.animation_rounded,

          "title":
          "Premium UI/UX Engineering",

          "subtitle":
          "Luxury-level cinematic interfaces with futuristic animations and highly engaging user experiences.",
        },

        {
          "icon":
          Icons.shopping_bag_rounded,

          "title":
          "E-Commerce Solutions",

          "subtitle":
          "Scalable commerce systems with payment integrations, loyalty programs and real-time inventory systems.",
        },

        {
          "icon":
          Icons.api_rounded,

          "title":
          "REST API Integration",

          "subtitle":
          "Robust backend communication systems with secure API integrations and cloud services.",
        },
      ],

      skills: [

        {
          "title": "Flutter",
        },

        {
          "title": "Dart",
        },

        {
          "title": "Firebase",
        },

        {
          "title": "Riverpod",
        },

        {
          "title": "Bloc",
        },

        {
          "title": "REST APIs",
        },

        {
          "title": "Node.js",
        },

        {
          "title": "MongoDB",
        },

        {
          "title": "AWS",
        },

        {
          "title": "SQLite",
        },

        {
          "title": "Git & GitHub",
        },

        {
          "title": "Responsive UI",
        },

        {
          "title": "Performance Optimization",
        },

        {
          "title": "Firebase Cloud Functions",
        },
      ],

      experience: [

        {
          "year":
          "March 2025 - Present",

          "title":
          "Flutter Developer",

          "company":
          "Geften Cables Pvt Ltd",

          "subtitle":
          "Leading end-to-end development of scalable production-grade Flutter applications with Firebase, REST APIs and cloud services. Built reward ecosystems, admin dashboards, loyalty platforms and enterprise-grade mobile systems.",
        },

        {
          "year":
          "June 2023 - February 2025",

          "title":
          "Software Developer",

          "company":
          "First Logic Meta Lab Pvt Ltd",

          "subtitle":
          "Developed high-performance cross-platform applications while optimizing launch performance, scalability and maintainability using modern architectures and clean coding standards.",
        },
      ],

      featuredProjects: [

        {
          "title":
          "Gefmart B2B Retailer App",

          "subtitle":
          "Complete B2B commerce ecosystem with QR reward scanning, loyalty systems, Firebase backend and admin dashboard architecture.",

          "tags": [
            "Flutter",
            "Firebase",
            "Node.js",
            "AWS",
          ],

          "store":
          "Playstore",

          "logo":
          "assets/images/gefmart-logo.jpeg",
        },

        {
          "title":
          "Geften E.E.A",

          "subtitle":
          "Reward tracking and loyalty redemption application with real-time cloud infrastructure and secure backend integration.",

          "tags": [
            "Flutter",
            "REST APIs",
            "Firebase",
          ],

          "store":
          "Playstore",

          "logo":
          "assets/images/geften-logo.jpeg",
        },

        {
          "title":
          "Blithe Event Manager",

          "subtitle":
          "Real-time event management system with media uploads, notifications, recommendations and cloud integrations.",

          "tags": [
            "Flutter",
            "Firebase",
            "Cloud Functions",
          ],

          "store":
          "Playstore",

          "logo":
          "assets/images/blithe-logo.jpeg",
        },
      ],
    ),

    /// DATA SCIENTIST
    RoleModel(
      title: "Data Scientist",

      subtitle:
      "Transforming raw data into intelligent systems, predictive insights and AI-powered solutions for real-world impact.",

      summary:
      "Aspiring Data Scientist with strong expertise in Python, machine learning, data analytics and artificial intelligence. Skilled in building predictive systems, conversational AI applications and data-driven analytical workflows using Scikit-learn, TensorFlow, Pandas, NumPy and modern AI frameworks. Passionate about solving real-world problems using data, automation and advanced machine learning techniques.",

      gifPath:
      "assets/gif/scientist-gif.gif",

      certifications: [

        "Certification in Data Science & Machine Learning - Entri Elevate, NSDC",

        "Certification in Data Science & Machine Learning - Illinois Tech, USA",
      ],

      services: [

        {
          "icon":
          Icons.auto_graph_rounded,

          "title":
          "Data Analytics",

          "subtitle":
          "Transforming raw business data into meaningful insights, dashboards and decision-making systems.",
        },

        {
          "icon":
          Icons.psychology_alt_rounded,

          "title":
          "Machine Learning Solutions",

          "subtitle":
          "Building intelligent ML models for classification, prediction, recommendation and automation.",
        },

        {
          "icon":
          Icons.smart_toy_rounded,

          "title":
          "Conversational AI Systems",

          "subtitle":
          "AI chatbots, RAG systems and LLM-powered applications with intelligent response generation.",
        },

        {
          "icon":
          Icons.query_stats_rounded,

          "title":
          "Predictive Analytics",

          "subtitle":
          "Forecasting trends and user behaviors using advanced machine learning algorithms.",
        },

        {
          "icon":
          Icons.data_object_rounded,

          "title":
          "Data Processing Pipelines",

          "subtitle":
          "Data cleaning, preprocessing, feature engineering and scalable analytical workflows.",
        },

        {
          "icon":
          Icons.insights_rounded,

          "title":
          "AI Research & Experimentation",

          "subtitle":
          "Research-driven experimentation with deep learning, NLP and modern AI frameworks.",
        },
      ],

      skills: [

        {
          "title": "Python",
        },

        {
          "title": "Machine Learning",
        },

        {
          "title": "TensorFlow",
        },

        {
          "title": "PyTorch",
        },

        {
          "title": "Scikit-learn",
        },

        {
          "title": "Pandas",
        },

        {
          "title": "NumPy",
        },

        {
          "title": "FAISS",
        },

        {
          "title": "LLMs",
        },

        {
          "title": "Feature Engineering",
        },

        {
          "title":
          "Exploratory Data Analysis",
        },

        {
          "title":
          "Data Visualization",
        },

        {
          "title":
          "NLP",
        },

        {
          "title":
          "Deep Learning",
        },
      ],

      experience: [],

      featuredProjects: [

        {
          "title":
          "Conversational AI Chatbot",

          "subtitle":
          "Built an NLP-powered AI chatbot using FAISS, TF-IDF vectorization, RAG pipelines and semantic search systems.",

          "tags": [
            "Python",
            "LLM",
            "FAISS",
            "NLP",
          ],

          "store":
          "GitHub",

          "logo":
          "assets/images/github-logo.jpeg",
        },

        {
          "title":
          "Predictive Analytics Engine",

          "subtitle":
          "Machine learning pipeline for predictive analytics, classification and business intelligence workflows.",

          "tags": [
            "Machine Learning",
            "Scikit-learn",
            "Analytics",
          ],

          "store":
          "Case Study",

          "logo":
          "assets/images/github-logo.jpeg",
        },
      ],
    ),
  ];

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration:
        const Duration(milliseconds: 900),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width =
        MediaQuery.of(context).size.width;

    final isMobile = width < 700;
    final isTablet =
        width >= 700 && width < 1100;

    return Scaffold(
      body: Stack(
        children: [

          /// BACKGROUND
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

          /// GOLD GLOW
          Positioned(
            top: -250,
            left: -180,
            child: Container(
              width: 550,
              height: 550,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffD4AF37)
                    .withValues(alpha: .05),
              ),
            ),
          ),

          Positioned(
            bottom: -300,
            right: -250,
            child: Container(
              width: 700,
              height: 700,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffD4AF37)
                    .withValues(alpha: .04),
              ),
            ),
          ),

          const AnimatedBackground(),

          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1.25,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(
                          alpha: .82),
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
                  horizontal:
                  isMobile ? 20 : 60,
                  vertical: 30,
                ),
                child: Column(
                  children: [

                    _buildNavbar(isMobile),

                    const SizedBox(height: 20),

                    Container(
                      key: homeKey,
                      child: isMobile
                          ? _buildMobileLayout()
                          : _buildDesktopLayout(
                          isTablet),
                    ),

                    const SizedBox(height: 120),

                    Container(
                      key: servicesKey,
                      child:
                      _buildServicesSection(),
                    ),

                    const SizedBox(height: 120),

                    Container(
                      key: skillsKey,
                      child:
                      _buildSkillsSection(),
                    ),

                    if(currentRole
                        .experience.isNotEmpty)
                      const SizedBox(
                          height: 120),

                    if(currentRole
                        .experience.isNotEmpty)
                      Container(
                        key: experienceKey,
                        child:
                        _buildExperienceSection(),
                      ),

                    if(currentRole
                        .certifications
                        .isNotEmpty)
                      const SizedBox(
                          height: 120),

                    if(currentRole
                        .certifications
                        .isNotEmpty)
                      Container(
                        key:
                        certificationKey,
                        child:
                        _buildCertificationSection(),
                      ),

                    const SizedBox(height: 120),

                    Container(
                      key: projectsKey,
                      child:
                      _buildProjectsSection(),
                    ),

                    const SizedBox(height: 120),

                    Container(
                      key: contactKey,
                      child:
                      _buildContactSection(),
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

  Widget _buildNavbar(bool isMobile) {

    final isTablet =
        MediaQuery.of(context).size.width <
            1100;

    return Padding(
      padding:
      const EdgeInsets.only(bottom: 40),

      child: isMobile

          ? Row(
        mainAxisAlignment:
        MainAxisAlignment
            .spaceBetween,

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

                overflow:
                TextOverflow.ellipsis,

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight:
                  FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),

          PopupMenuButton<String>(
            color:
            const Color(0xff050505),

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
                  scrollToSection(
                      servicesKey);
                  break;

                case "Skills":
                  scrollToSection(
                      skillsKey);
                  break;

                case "Experience":
                  scrollToSection(
                      experienceKey);
                  break;

                case "Certifications":
                  scrollToSection(
                      certificationKey);
                  break;

                case "Projects":
                  scrollToSection(
                      projectsKey);
                  break;

                case "Contact":
                  scrollToSection(
                      contactKey);
                  break;
              }
            },

            itemBuilder: (context) => [

              popupItem("Home"),

              popupItem("Services"),

              popupItem("Skills"),

              if(currentRole
                  .experience
                  .isNotEmpty)
                popupItem("Experience"),

              if(currentRole
                  .certifications
                  .isNotEmpty)
                popupItem(
                    "Certifications"),

              popupItem("Projects"),

              popupItem("Contact"),
            ],
          ),
        ],
      )

          : Row(
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

                style: TextStyle(
                  color: Colors.white,
                  fontSize:
                  isTablet ? 22 : 28,
                  fontWeight:
                  FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),

          Expanded(
            child:
            SingleChildScrollView(
              scrollDirection:
              Axis.horizontal,

              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.end,

                children: [

                  navButton(
                    "Home",
                        () =>
                        scrollToSection(
                            homeKey),
                  ),

                  navButton(
                    "Services",
                        () =>
                        scrollToSection(
                            servicesKey),
                  ),

                  navButton(
                    "Skills",
                        () =>
                        scrollToSection(
                            skillsKey),
                  ),

                  if(currentRole
                      .experience
                      .isNotEmpty)
                    navButton(
                      "Experience",
                          () =>
                          scrollToSection(
                              experienceKey),
                    ),

                  if(currentRole
                      .certifications
                      .isNotEmpty)
                    navButton(
                      "Certifications",
                          () =>
                          scrollToSection(
                              certificationKey),
                    ),

                  navButton(
                    "Projects",
                        () =>
                        scrollToSection(
                            projectsKey),
                  ),

                  navButton(
                    "Contact",
                        () =>
                        scrollToSection(
                            contactKey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> popupItem(
      String title) {

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

  Widget navButton(
      String text,
      VoidCallback onTap,
      ) {

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

              margin:
              const EdgeInsets.symmetric(
                  horizontal: 10),

              padding:
              const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),

              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(
                    14),

                color: hovered
                    ? const Color(
                    0xffD4AF37)
                    .withValues(
                    alpha: .12)
                    : Colors.transparent,

                border: Border.all(
                  color: hovered
                      ? const Color(
                      0xffD4AF37)
                      : Colors.transparent,
                ),
              ),

              child: Text(
                text,

                style: TextStyle(
                  color: hovered
                      ? const Color(
                      0xffD4AF37)
                      : Colors.white,

                  fontWeight:
                  FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileLayout() {

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Text(
          "Hey There 👋",

          style: TextStyle(
            color:
            Colors.white.withValues(
                alpha: .9),

            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 30),

        _buildCards(),

        const SizedBox(height: 40),

        _buildTexts(true),
      ],
    );
  }

  Widget _buildDesktopLayout(
      bool isTablet,
      ) {

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.center,

        children: [

          Expanded(
            flex: 5,

            child: Align(
              alignment:
              Alignment.centerLeft,

              child: _buildCards(),
            ),
          ),

          const SizedBox(width: 50),

          Expanded(
            flex: 4,
            child: _buildTexts(false),
          ),
        ],
      ),
    );
  }

  Widget _buildCards() {

    return SizedBox(
      height: 520,

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

              if (_pageController
                  .position
                  .haveDimensions) {

                value =
                    _pageController.page! -
                        index;

                value =
                    (1 -
                        (value.abs() * .2))
                        .clamp(.0, 1.0);
              }

              return Transform.scale(
                scale: value,

                child: Transform.rotate(
                  angle:
                  (index - currentIndex) *
                      .05,

                  child: child,
                ),
              );
            },

            child: Center(
              child: HoverTiltCard(

                child: SizedBox(
                  width: 340,
                  height: 450,

                  child: Stack(
                    clipBehavior:
                    Clip.none,

                    alignment:
                    Alignment.center,

                    children: [

                      /// GOLD OUTER GLOW
                      Positioned(
                        bottom: 35,

                        child: Container(
                          width: 250,
                          height: 250,

                          decoration:
                          BoxDecoration(
                            shape:
                            BoxShape.circle,

                            color:
                            const Color(
                                0xffD4AF37)
                                .withValues(
                                alpha:
                                .08),
                          ),
                        ),
                      ),

                      /// MAIN CARD
                      Positioned(
                        bottom: 0,

                        child: Container(
                          width: 295,
                          height: 300,

                          decoration:
                          BoxDecoration(
                            borderRadius:
                            BorderRadius
                                .circular(
                                36),

                            gradient:
                            const LinearGradient(
                              begin:
                              Alignment
                                  .topLeft,

                              end: Alignment
                                  .bottomRight,

                              colors: [

                                Color(
                                    0xff090909),

                                Color(
                                    0xff000000),
                              ],
                            ),

                            border: Border.all(
                              color:
                              const Color(
                                  0xffD4AF37)
                                  .withValues(
                                  alpha:
                                  .85),

                              width: 1.5,
                            ),

                            boxShadow: [

                              BoxShadow(
                                color:
                                const Color(
                                    0xffD4AF37)
                                    .withValues(
                                    alpha:
                                    .14),

                                blurRadius:
                                35,

                                spreadRadius:
                                3,
                              ),
                            ],
                          ),

                          child: Stack(
                            children: [

                              /// GOLD LIGHT
                              Positioned(
                                top: -40,
                                right: -40,

                                child:
                                Container(
                                  width: 140,
                                  height: 140,

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
                                        .06),
                                  ),
                                ),
                              ),

                              /// INNER FLAME
                              Positioned(
                                bottom: -20,
                                left: -10,
                                right: -10,

                                child: Container(
                                  height: 150,

                                  decoration:
                                  BoxDecoration(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        120),

                                    gradient:
                                    LinearGradient(
                                      begin:
                                      Alignment
                                          .topCenter,

                                      end:
                                      Alignment
                                          .bottomCenter,

                                      colors: [

                                        const Color(
                                            0xffD4AF37)
                                            .withValues(
                                            alpha:
                                            .0),

                                        const Color(
                                            0xffD4AF37)
                                            .withValues(
                                            alpha:
                                            .08),

                                        const Color(
                                            0xffFFB300)
                                            .withValues(
                                            alpha:
                                            .20),

                                        const Color(
                                            0xffFF7A00)
                                            .withValues(
                                            alpha:
                                            .26),

                                        const Color(
                                            0xffFF3D00)
                                            .withValues(
                                            alpha:
                                            .14),
                                      ],
                                    ),
                                  ),
                                )
                                    .animate(
                                  onPlay:
                                      (controller) =>
                                      controller
                                          .repeat(
                                          reverse:
                                          true),
                                )
                                    .moveY(
                                  begin: 0,
                                  end: 8,
                                  duration:
                                  2500.ms,
                                )
                                    .fade(
                                  begin: .7,
                                  end: 1,
                                  duration:
                                  2500.ms,
                                ),
                              ),

                              /// CONTENT
                              Padding(
                                padding:
                                const EdgeInsets
                                    .fromLTRB(
                                    24,
                                    105,
                                    24,
                                    22),

                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,

                                  children: [

                                    Text(
                                      role.title,

                                      maxLines: 1,

                                      overflow:
                                      TextOverflow
                                          .ellipsis,

                                      style:
                                      const TextStyle(
                                        color: Color(
                                            0xffD4AF37),

                                        fontSize:
                                        26,

                                        fontWeight:
                                        FontWeight
                                            .bold,
                                      ),
                                    ),

                                    const SizedBox(
                                        height:
                                        16),

                                    Text(
                                      role.subtitle,

                                      maxLines: 5,

                                      overflow:
                                      TextOverflow
                                          .ellipsis,

                                      style:
                                      TextStyle(
                                        color: Colors
                                            .white
                                            .withValues(
                                            alpha:
                                            .72),

                                        height:
                                        1.7,

                                        fontSize:
                                        14.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// PERSON GIF
                      Positioned(
                        top: 5,

                        child:
                        AnimatedSwitcher(
                          duration:
                          const Duration(
                              milliseconds:
                              350),

                          child: HeroImage(
                            key: UniqueKey(),
                            image: role.gifPath,
                          ),
                        ),
                      ),

                      /// LEFT BUTTON
                      if (currentIndex > 0)
                        Positioned(
                          left: 0,
                          top: 90,

                          child:
                          roleSwitchButton(
                            Icons
                                .arrow_back_ios_new_rounded,

                                () {

                              _pageController
                                  .previousPage(
                                duration:
                                const Duration(
                                    milliseconds:
                                    500),

                                curve: Curves
                                    .easeInOut,
                              );
                            },
                          ),
                        ),

                      /// RIGHT BUTTON
                      if (currentIndex <
                          roles.length - 1)

                        Positioned(
                          right: 0,
                          top: 90,

                          child:
                          roleSwitchButton(
                            Icons
                                .arrow_forward_ios_rounded,

                                () {

                              _pageController
                                  .nextPage(
                                duration:
                                const Duration(
                                    milliseconds:
                                    500),

                                curve: Curves
                                    .easeInOut,
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

          color:
          Colors.black.withValues(
              alpha: .6),

          border: Border.all(
            color: const Color(0xffD4AF37)
                .withValues(alpha: .7),
          ),
        ),

        child: Icon(
          icon,
          color: const Color(0xffD4AF37),
          size: 20,
        ),
      ),
    )
        .animate(
      onPlay: (controller) =>
          controller.repeat(
              reverse: true),
    )
        .scaleXY(
      begin: 1,
      end: 1.08,
      duration: 2.seconds,
    );
  }

  Widget _buildTexts(bool isMobile) {

    final role = currentRole;

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      mainAxisAlignment:
      MainAxisAlignment.center,

      children: [

        if(!isMobile)

          Text(
            "Hey There 👋",

            style: TextStyle(
              color: Colors.white
                  .withValues(alpha: .85),

              fontSize: 22,
            ),
          ),

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
        ),

        const SizedBox(height: 20),

        AnimatedTextKit(
          repeatForever: true,

          animatedTexts: [

            TypewriterAnimatedText(
              role.title,

              speed:
              const Duration(
                  milliseconds: 80),

              textStyle:
              const TextStyle(
                color:
                Color(0xffD4AF37),

                fontSize: 30,

                fontWeight:
                FontWeight.w600,
              ),
            ),
          ],
        ),

        const SizedBox(height: 25),

        Text(
          role.subtitle,

          style: TextStyle(
            color:
            Colors.white.withValues(
                alpha: .75),

            fontSize: 18,
            height: 1.8,
          ),
        ),

        const SizedBox(height: 24),

        Container(
          padding: const EdgeInsets.all(24),

          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(24),

            border: Border.all(
              color: const Color(0xffD4AF37)
                  .withValues(alpha: .25),
            ),

            color: const Color(0xff080808),
          ),

          child: Text(
            role.summary,

            style: TextStyle(
              color: Colors.white
                  .withValues(alpha: .75),

              fontSize: 15,
              height: 1.9,
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

              onTap: () =>
                  scrollToSection(
                      projectsKey),
            ),

            PremiumButton(
              title: "Download Resume",
              filled: false,
              onTap: () {},
            ),
          ],
        ),
      ],
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
            color:
            Colors.white.withValues(
                alpha: .7),

            fontSize: 18,
            height: 1.8,
          ),
        ),

        const SizedBox(height: 60),

        Wrap(
          spacing: 30,
          runSpacing: 30,
          alignment: WrapAlignment.center,

          children:
          currentRole.services.map((service) {

            return serviceCard(
              icon: service["icon"],

              title:
              service["title"],

              subtitle:
              service["subtitle"],
            );

          }).toList(),
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

            padding:
            const EdgeInsets.all(28),

            transform:
            Matrix4.identity()
              ..translate(
                0.0,
                hovered ? -12.0 : 0.0,
              ),

            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(30),

              border: Border.all(
                color:
                const Color(0xffD4AF37)
                    .withValues(
                    alpha:
                    hovered
                        ? .8
                        : .35),
              ),

              color:
              const Color(0xff050505),

              boxShadow: hovered
                  ? [
                BoxShadow(
                  color: const Color(
                      0xffD4AF37)
                      .withValues(
                      alpha:
                      .25),

                  blurRadius: 35,
                ),
              ]
                  : [],
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Container(
                  height: 72,
                  width: 72,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    gradient:
                    LinearGradient(
                      colors: [

                        const Color(
                            0xffD4AF37)
                            .withValues(
                            alpha:
                            .25),

                        const Color(
                            0xff8B6B1F)
                            .withValues(
                            alpha:
                            .12),
                      ],
                    ),
                  ),

                  child: Icon(
                    icon,
                    color:
                    const Color(
                        0xffD4AF37),

                    size: 34,
                  ),
                ),

                const SizedBox(height: 28),

                Text(
                  title,

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 18),

                Text(
                  subtitle,

                  style: TextStyle(
                    color:
                    Colors.white
                        .withValues(
                        alpha: .7),

                    height: 1.8,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkillsSection() {

    return Column(
      children: [

        sectionTitle("Skills"),

        const SizedBox(height: 50),

        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,

          children:
          currentRole.skills.map((skill) {

            return SkillChip(
              skill: skill["title"],
            );

          }).toList(),
        ),
      ],
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

          children:
          currentRole.experience.map((exp) {

            return experienceCard(
              year: exp["year"],

              title:
              "${exp["title"]} • ${exp["company"]}",

              subtitle:
              exp["subtitle"],
            );

          }).toList(),
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
        borderRadius:
        BorderRadius.circular(28),

        border: Border.all(
          color: const Color(0xffD4AF37)
              .withValues(alpha: .4),
        ),

        color: const Color(0xff050505),
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
              color:
              Colors.white.withValues(
                  alpha: .7),

              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificationSection() {

    return Column(
      children: [

        sectionTitle("Certifications"),

        const SizedBox(height: 40),

        Column(
          children:
          currentRole.certifications.map((cert) {

            return Container(
              margin:
              const EdgeInsets.only(
                  bottom: 20),

              padding:
              const EdgeInsets.all(24),

              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(
                    24),

                border: Border.all(
                  color:
                  const Color(0xffD4AF37)
                      .withValues(
                      alpha: .25),
                ),

                color:
                const Color(0xff080808),
              ),

              child: Row(
                children: [

                  const Icon(
                    Icons
                        .workspace_premium_rounded,

                    color:
                    Color(0xffD4AF37),
                  ),

                  const SizedBox(width: 18),

                  Expanded(
                    child: Text(
                      cert,

                      style:
                      const TextStyle(
                        color:
                        Colors.white,

                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            );

          }).toList(),
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

            final isMobile =
                constraints.maxWidth < 800;

            return Wrap(
              spacing: 30,
              runSpacing: 30,
              alignment:
              WrapAlignment.center,

              children:
              currentRole.featuredProjects
                  .map((project) {

                return ProjectCard(
                  isMobile: isMobile,

                  title:
                  project["title"],

                  subtitle:
                  project["subtitle"],

                  tags:
                  List<String>.from(
                      project["tags"]),

                  logo:
                  project["logo"],
                );

              }).toList(),
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
          constraints:
          const BoxConstraints(
            maxWidth: 900,
          ),

          padding: const EdgeInsets.all(30),

          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(24),

            border: Border.all(
              color: const Color(0xffD4AF37)
                  .withValues(alpha: .4),
            ),

            color: const Color(0xff080808),
          ),

          child: Column(
            children: [

              Text(
                "Let's build something amazing together.",

                textAlign: TextAlign.center,

                style: TextStyle(
                  color: Colors.white
                      .withValues(alpha: .8),

                  fontSize: 22,
                ),
              ),

              const SizedBox(height: 25),

              Wrap(
                alignment:
                WrapAlignment.center,

                spacing: 20,
                runSpacing: 20,

                children: [

                  socialButton(
                      Icons.email),

                  socialButton(
                      Icons.code),

                  socialButton(
                      Icons.camera_alt),

                  socialButton(
                      Icons.business),
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
          color: const Color(0xffD4AF37)
              .withValues(alpha: .5),
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

  @override
  void didUpdateWidget(
      covariant HeroImage oldWidget,
      ) {

    super.didUpdateWidget(oldWidget);

    /// FORCE RELOAD WHEN IMAGE CHANGES
    if (oldWidget.image !=
        widget.image) {

      bytes = null;

      loadGif();
    }
  }

  Future<void> loadGif() async {

    final data =
    await rootBundle.load(
        widget.image);

    if (!mounted) return;

    setState(() {

      /// CREATE FRESH MEMORY INSTANCE
      bytes = Uint8List.fromList(
        data.buffer.asUint8List(),
      );
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

          /// IMPORTANT
          key: UniqueKey(),
        ),
      ),
    )
        .animate(
      onPlay: (controller) =>
          controller.repeat(
              reverse: true),
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
  final VoidCallback onTap;

  const PremiumButton({
    super.key,
    required this.title,
    required this.filled,
    required this.onTap,
  });

  @override
  State<PremiumButton> createState() =>
      _PremiumButtonState();
}

class _PremiumButtonState
    extends State<PremiumButton> {

  bool hovered = false;

  @override
  Widget build(BuildContext context) {

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

        onTap: widget.onTap,

        child: AnimatedContainer(
          duration: 300.ms,

          padding:
          const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 18,
          ),

          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(16),

            gradient: widget.filled

                ? const LinearGradient(
              colors: [
                Color(0xffD4AF37),
                Color(0xff8B6B1F),
              ],
            )

                : null,

            border: Border.all(
              color:
              const Color(0xffD4AF37),
            ),
          ),

          transform:
          Matrix4.identity()
            ..scale(
                hovered ? 1.05 : 1.0),

          child: Text(
            widget.title,

            style: TextStyle(
              color: widget.filled
                  ? Colors.black
                  : Colors.white,

              fontWeight:
              FontWeight.bold,
            ),
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
  State<SkillChip> createState() =>
      _SkillChipState();
}

class _SkillChipState
    extends State<SkillChip> {

  bool hovered = false;

  @override
  Widget build(BuildContext context) {

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
        duration: 300.ms,

        padding:
        const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 14,
        ),

        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(50),

          border: Border.all(
            color: const Color(0xffD4AF37)
                .withValues(alpha: .6),
          ),

          color: hovered

              ? const Color(0xffD4AF37)
              .withValues(alpha: .15)

              : const Color(0xff050505),
        ),

        child: Text(
          widget.skill,

          style:
          const TextStyle(
              color: Colors.white),
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {

  final bool isMobile;

  final String title;
  final String subtitle;
  final List<String> tags;
  final String logo;

  const ProjectCard({
    super.key,
    required this.isMobile,
    required this.title,
    required this.subtitle,
    required this.tags,
    required this.logo,
  });

  @override
  State<ProjectCard> createState() =>
      _ProjectCardState();
}

class _ProjectCardState
    extends State<ProjectCard> {

  bool hovered = false;

  @override
  Widget build(BuildContext context) {

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

        width:
        widget.isMobile
            ? double.infinity
            : 360,

        padding: const EdgeInsets.all(24),

        transform:
        Matrix4.identity()
          ..translate(
              0.0,
              hovered ? -10.0 : 0.0),

        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(28),

          border: Border.all(
            color: const Color(0xffD4AF37)
                .withValues(alpha: .5),
          ),

          color:
          const Color(0xff050505),
        ),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Container(
              height: 180,

              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(
                    20),

                gradient:
                LinearGradient(
                  colors: [

                    const Color(
                        0xffD4AF37)
                        .withValues(
                        alpha: .2),

                    Colors.black,
                  ],
                ),
              ),

              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(
                    20),
                child: Image.asset(
                  widget.logo,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              widget.title,

              style: const TextStyle(
                color:
                Color(0xffD4AF37),

                fontSize: 24,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              widget.subtitle,

              style: TextStyle(
                color:
                Colors.white.withValues(
                    alpha: .7),

                height: 1.7,
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children:
              widget.tags.map((e) {

                return miniTag(e);

              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget miniTag(String text) {

    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),

      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(30),

        color:
        const Color(0xffD4AF37)
            .withValues(alpha: .1),
      ),

      child: Text(
        text,

        style: const TextStyle(
          color:
          Color(0xffD4AF37),

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
  State<HoverTiltCard> createState() =>
      _HoverTiltCardState();
}

class _HoverTiltCardState
    extends State<HoverTiltCard> {

  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {

    return MouseRegion(

      onHover: (event) {

        final size =
            MediaQuery.of(context).size;

        setState(() {

          x = (event.position.dy -
              size.height / 2) /
              50;

          y = -(event.position.dx -
              size.width / 2) /
              50;
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

        transform:
        Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(x * pi / 180)
          ..rotateY(y * pi / 180),

        child: widget.child,
      ),
    );
  }
}

class AnimatedBackground
    extends StatelessWidget {

  const AnimatedBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Stack(
      children:
      List.generate(25, (index) {

        final random = Random();

        final left =
            random.nextDouble() * 1400;

        final top =
            random.nextDouble() * 2000;

        return Positioned(
          left: left,
          top: top,

          child: Container(
            width:
            random.nextDouble() *
                4 +
                2,

            height:
            random.nextDouble() *
                4 +
                2,

            decoration: BoxDecoration(
              shape: BoxShape.circle,

              color:
              const Color(0xffD4AF37)
                  .withValues(
                  alpha: .4),
            ),
          )
              .animate(
            onPlay:
                (controller) =>
                controller.repeat(),
          )
              .moveY(
            begin: 0,
            end: -20,

            duration: Duration(
              seconds:
              random.nextInt(4) +
                  3,
            ),
          )
              .fadeIn()
              .fadeOut(),
        );
      }),
    );
  }
}