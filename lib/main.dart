// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'features/chat/logic/chat_provider.dart';
import 'widgets/animated_splash.dart';

void main() {
  runApp(const MediBrain());
}

class MediBrain extends StatelessWidget {
  const MediBrain({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatProvider(),
      child: MaterialApp(
        title: 'MediBrain',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const AnimatedSplash(),
      ),
    );
  }
}
