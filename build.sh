#!/usr/bin/env bash
set -e

echo "=== [Waypoint] Starting Vercel Build for Flutter Web ==="

# Define Flutter SDK directory
FLUTTER_DIR="$HOME/flutter"

if [ ! -d "$FLUTTER_DIR" ]; then
  echo ">>> Downloading Flutter SDK (stable branch)..."
  git clone https://github.com/flutter/flutter.git --depth 1 -b stable "$FLUTTER_DIR"
else
  echo ">>> Flutter SDK found in cache at $FLUTTER_DIR"
fi

# Add Flutter to PATH
export PATH="$FLUTTER_DIR/bin:$PATH"

echo ">>> Verifying Flutter installation..."
flutter --version

echo ">>> Configuring Flutter for Web..."
flutter config --no-analytics
flutter precache --web

echo ">>> Installing project dependencies..."
flutter pub get

echo ">>> Building Flutter Web in release mode..."
flutter build web --release

echo "=== [Waypoint] Flutter Web build completed successfully in build/web ==="

