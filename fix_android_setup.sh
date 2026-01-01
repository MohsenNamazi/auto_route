#!/bin/bash
# Android Setup Fix Script

echo "=== Fixing Android Setup ==="
echo ""

# 1. Kill stuck processes
echo "1. Killing stuck Flutter/ADB processes..."
killall -9 dart 2>/dev/null || true
killall -9 adb 2>/dev/null || true
sleep 1

# 2. Restart ADB server
echo "2. Restarting ADB server..."
adb kill-server
sleep 1
adb start-server

# 3. Set Android environment variables (for current session)
echo "3. Setting Android environment variables..."
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

# 4. Check device status
echo ""
echo "4. Checking device status..."
adb devices

echo ""
echo "=== Next Steps ==="
echo "1. On your Android phone, check for 'Allow USB debugging' prompt"
echo "2. Tap 'Allow' and check 'Always allow from this computer'"
echo "3. Run: fvm flutter devices"
echo ""
echo "To make environment variables permanent, add to ~/.zshrc:"
echo "  export ANDROID_HOME=\$HOME/Library/Android/sdk"
echo "  export ANDROID_SDK_ROOT=\$HOME/Library/Android/sdk"
echo "  export PATH=\$PATH:\$ANDROID_HOME/platform-tools:\$ANDROID_HOME/tools"

