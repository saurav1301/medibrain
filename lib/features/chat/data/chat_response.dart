// lib/features/chat/data/chat_response.dart
class ChatResponse {
  final String answer;
  final int localUsed;
  final Map<String, dynamic> verification;
  final String? error;

  ChatResponse({
    required this.answer,
    required this.localUsed,
    required this.verification,
    this.error,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      answer: json['answer'] ?? '',
      localUsed: json['local_used'] ?? 0,
      verification: json['verification'] ?? {"ok": false},
    );
  }
}
