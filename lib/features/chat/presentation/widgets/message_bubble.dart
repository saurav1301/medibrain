// // lib/features/chat/presentation/widgets/message_bubble.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:google_fonts/google_fonts.dart';

// class MessageBubble extends StatelessWidget {
//   final String text;
//   final bool isUser;

//   const MessageBubble({super.key, required this.text, required this.isUser});

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//         padding: const EdgeInsets.all(16),
//         constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.78),
//         decoration: BoxDecoration(
//           color: isUser ? const Color(0xFF007AFF) : Colors.white,
//           borderRadius: BorderRadius.circular(24),
//           boxShadow: [
//             BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 4)),
//           ],
//         ),
//         child: Text(
//           text,
//           style: GoogleFonts.ibmPlexSans(
//             color: isUser ? Colors.white : Colors.black87,
//             fontSize: 16,
//             height: 1.5,
//           ),
//         ),
//       ).animate()
//        .fadeIn(duration: 400.ms)
//        .slideY(begin: 0.3, end: 0, curve: Curves.easeOutCubic),
//     );
//   }
// }

// lib/features/chat/presentation/widgets/message_bubble.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isUser;

  const MessageBubble({super.key, required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child:
          Container(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                padding: const EdgeInsets.all(16),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.78,
                ),
                decoration: BoxDecoration(
                  color: isUser ? const Color(0xFF007AFF) : Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  text,
                  style: GoogleFonts.ibmPlexSans(
                    color: isUser ? Colors.white : Colors.black87,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              )
              .animate() // Now works!
              .fadeIn(duration: 400.ms)
              .slideY(begin: 0.3, end: 0, curve: Curves.easeOutCubic),
    );
  }
}
