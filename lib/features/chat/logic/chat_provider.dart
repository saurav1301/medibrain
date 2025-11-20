// lib/features/chat/logic/chat_provider.dart
import 'package:flutter/material.dart';
import '../data/chat_response.dart';
import '../../../core/services/api_service.dart';

class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  Message({required this.text, required this.isUser})
    : timestamp = DateTime.now();
}

class ChatProvider extends ChangeNotifier {
  List<Message> messages = [];
  bool isLoading = false;

  void addUserMessage(String text) {
    messages.add(Message(text: text, isUser: true));
    notifyListeners();
    _sendToAI(text);
  }

  void _sendToAI(String question) async {
    isLoading = true;
    notifyListeners();

    messages.add(Message(text: "", isUser: false)); // placeholder
    notifyListeners();

    try {
      final response = await ApiService.askQuestion(question);

      // Replace placeholder with real answer
      messages.removeLast();
      messages.add(Message(text: response.answer, isUser: false));
    } catch (e) {
      messages.removeLast();
      messages.add(
        Message(text: "Sorry, I couldn't process that.", isUser: false),
      );
    }

    isLoading = false;
    notifyListeners();
  }
}
