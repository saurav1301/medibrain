#!/bin/bash

echo "📁 Creating Flutter folder structure with EMPTY files..."

# --- ROOT LIB FOLDER ---
mkdir -p lib/core/theme
mkdir -p lib/core/services

mkdir -p lib/features/chat/data
mkdir -p lib/features/chat/presentation/screens
mkdir -p lib/features/chat/presentation/widgets
mkdir -p lib/features/chat/logic

mkdir -p lib/widgets

# --- Core Files ---
touch lib/core/constants.dart
touch lib/core/theme/app_theme.dart
touch lib/core/services/api_service.dart

# --- Chat Feature Files ---
touch lib/features/chat/data/chat_response.dart
touch lib/features/chat/data/chat_api.dart

touch lib/features/chat/logic/chat_provider.dart

touch lib/features/chat/presentation/screens/chat_screen.dart
touch lib/features/chat/presentation/widgets/message_bubble.dart
touch lib/features/chat/presentation/widgets/typing_indicator.dart
touch lib/features/chat/presentation/widgets/sources_carousel.dart

# --- Global Widgets ---
touch lib/widgets/animated_splash.dart
touch lib/widgets/glowing_button.dart

# --- Main File ---
touch lib/main.dart

echo "✅ Structure created successfully."
