#!/bin/bash
# Flutter SDK ডাউনলোড ও ইনস্টল করে Vercel এ Flutter ওয়েব বিল্ড করার স্ক্রিপ্ট

# এরর হলে স্ক্রিপ্ট বন্ধ করে দেবে
set -e

# লগিং ফাংশন
log() {
  echo "$(date +"%T") - $1"
}

# ওয়ার্কিং ডিরেক্টরি প্রিন্ট
log "Current directory: $(pwd)"
log "Starting Flutter installation and build process..."

# curl আছে কিনা চেক করা
if ! command -v curl &> /dev/null; then
  log "Error: curl is not installed. Please ensure curl is available in the build environment."
  exit 1
fi

# Flutter SDK ডাউনলোড
FLUTTER_VERSION="3.13.9-stable"
log "Downloading Flutter SDK version $FLUTTER_VERSION..."
curl -o flutter_linux_${FLUTTER_VERSION}.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}.tar.xz
log "Flutter SDK download completed"

# Flutter SDK এক্সট্র্যাক্ট
log "Extracting Flutter SDK..."
tar xf flutter_linux_${FLUTTER_VERSION}.tar.xz
log "Flutter SDK extraction completed"

# পারমিশন সেট করা
log "Setting permissions..."
chmod -R a+rx flutter
log "Permissions set"

# Flutter SDK PATH এ যোগ করা
export PATH="$PATH:$(pwd)/flutter/bin"
log "Flutter added to PATH: $PATH"

# Flutter ইনস্টলেশন চেক করা
log "Verifying Flutter installation..."
flutter --version
log "Flutter installation verified"

# Flutter ওয়েব সাপোর্ট এনাবল করা
log "Enabling Flutter web support..."
flutter config --enable-web
log "Flutter web support enabled"

# ডিপেন্ডেন্সি ইনস্টল করা
log "Installing Flutter dependencies..."
flutter pub get
log "Dependencies installed"

# ফ্লাটার ওয়েব বিল্ড করা
log "Building Flutter web app in release mode..."
flutter build web --release
log "Flutter web build completed"

# বিল্ড ফাইলগুলো চেক করা
log "Verifying build files..."
ls -la build/web
log "Build files verified"

log "Build process completed successfully!"