// lib/core/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../../features/chat/data/chat_response.dart';

class ApiService {
  static Future<ChatResponse> askQuestion(String question) async {
    try {
      final response = await http
          .post(
            Uri.parse(Config.BASE_URL + Config.ASK_ENDPOINT),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'question': question.trim()}),
          )
          .timeout(Config.TIMEOUT);

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return ChatResponse.fromJson(json);
      } else {
        throw Exception("Server error: ${response.statusCode}");
      }
    } catch (e) {
      return ChatResponse(
        answer: "I'm having trouble connecting. Please try again.",
        localUsed: 0,
        verification: {"ok": false},
        error: e.toString(),
      );
    }
  }
}
