// lib/features/chat/presentation/screens/chat_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../logic/chat_provider.dart';
import '../widgets/message_bubble.dart';
import '../widgets/typing_indicator.dart';
import '../widgets/sources_carousel.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatProvider>(context);
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MediBrain",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: provider.messages.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.biotech,
                          size: 80,
                          color: Colors.blue.shade300,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Ask me anything medical",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 20),
                    itemCount: provider.isLoading
                        ? provider.messages.length + 1
                        : provider.messages.length,
                    itemBuilder: (context, i) {
                      if (i == provider.messages.length && provider.isLoading) {
                        return const TypingIndicator();
                      }
                      final msg = provider.messages[i];
                      return MessageBubble(text: msg.text, isUser: msg.isUser);
                    },
                  ),
          ),

          // Loading skeleton when first message
          if (provider.isLoading && provider.messages.length == 1)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Column(
                  children: List.generate(
                    3,
                    (_) => Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          // Input
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Ask about symptoms, drugs, diseases...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                    maxLines: null,
                  ),
                ),
                const SizedBox(width: 12),
                FloatingActionButton(
                  onPressed: provider.isLoading
                      ? null
                      : () {
                          if (controller.text.trim().isNotEmpty) {
                            provider.addUserMessage(controller.text.trim());
                            controller.clear();
                          }
                        },
                  backgroundColor: const Color(0xFF007AFF),
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
