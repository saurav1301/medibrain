// lib/features/chat/presentation/widgets/typing_indicator.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 12, top: 8, bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            return Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: const BoxDecoration(
                    color: Color(0xFF007AFF),
                    shape: BoxShape.circle,
                  ),
                )
                // This is the correct way for scale animation
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                )
                .scale(
                  delay: (150 * index).ms,
                  duration: 600.ms,
                  begin: const Offset(0.6, 0.6), // ← Fixed: use Offset
                  end: const Offset(1.0, 1.0), // ← Fixed: use Offset
                  curve: Curves.easeInOut,
                );
          }),
        ),
      ),
    );
  }
}
