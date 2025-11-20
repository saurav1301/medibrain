// // lib/widgets/animated_splash.dart
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../features/chat/presentation/screens/chat_screen.dart';

// class AnimatedSplash extends StatefulWidget {
//   const AnimatedSplash({super.key});
//   @override
//   State<AnimatedSplash> createState() => _AnimatedSplashState();
// }

// class _AnimatedSplashState extends State<AnimatedSplash>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this)
//       ..forward().whenComplete(() {
//         Navigator.pushReplacement(
//           context,
//           PageRouteBuilder(
//             transitionDuration: const Duration(milliseconds: 1400),
//             pageBuilder: (_, __, ___) => const ChatScreen(),
//             transitionsBuilder: (_, a, __, child) => FadeTransition(
//               opacity: a,
//               child: ScaleTransition(scale: a, child: child),
//             ),
//           ),
//         );
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF0A0E21),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Lottie.asset('assets/lottie/medical_ai.json', width: 260),
//             Text(
//               "MediBrain",
//               style: GoogleFonts.orbitron(
//                 fontSize: 40,
//                 color: Colors.white,
//                 letterSpacing: 6,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               "AI Medical Intelligence",
//               style: GoogleFonts.ibmPlexSans(
//                 color: Colors.white70,
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/widgets/animated_splash.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import '../features/chat/presentation/screens/chat_screen.dart';

class AnimatedSplash extends StatefulWidget {
  const AnimatedSplash({super.key});

  @override
  State<AnimatedSplash> createState() => _AnimatedSplashState();
}

class _AnimatedSplashState extends State<AnimatedSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Fixed: Give duration when creating controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400), // Total splash time
    );

    // Fade in + scale up
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.elasticOut),
      ),
    );

    // Start animation
    _controller.forward();

    // Go to chat screen after animation + extra delay
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 600), () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 1200),
              pageBuilder: (_, __, ___) => const ChatScreen(),
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(scale: animation, child: child),
                );
              },
            ),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Your Lottie file (add any medical/brain/DNA animation from lottiefiles.com)
                Lottie.asset(
                  'assets/medical_ai.json',
                  width: 280,
                  fit: BoxFit.contain,
                  repeat: true,
                ),
                const SizedBox(height: 40),
                Text(
                  "MediBrain",
                  style: GoogleFonts.orbitron(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    letterSpacing: 8,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Your AI Medical Co-Pilot",
                  style: GoogleFonts.ibmPlexSans(
                    fontSize: 17,
                    color: Colors.white70,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
