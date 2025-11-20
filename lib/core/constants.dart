// lib/core/constants.dart
class Config {
  // For Android emulator
  static const String BASE_URL = "http://192.168.0.102:8080";
  // For iOS simulator or physical device on same WiFi
  // static const String BASE_URL = "http://192.168.x.x:8080";
  // Final deployed
  // static const String BASE_URL = "https://yourapp.up.railway.app";

  static const String ASK_ENDPOINT = "/ask";
  static const Duration TIMEOUT = Duration(seconds: 45);
}
