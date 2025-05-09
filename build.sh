#!/bin/bash

# Download and extract Flutter SDK
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.9-stable.tar.xz
tar xf flutter_linux_3.13.9-stable.tar.xz
export PATH="$PATH:`pwd`/flutter/bin"

# Verify Flutter installation
flutter --version

# Run Flutter commands
flutter pub get
flutter build web --release