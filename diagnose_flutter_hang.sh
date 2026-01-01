#!/bin/bash
# Comprehensive Flutter Hang Diagnostic Script

set -e

echo "=========================================="
echo "Flutter Hang Diagnostic Tool"
echo "=========================================="
echo ""

# Step 1: Kill all stuck processes
echo "[1/10] Killing stuck processes..."
killall -9 dart 2>/dev/null || true
killall -9 adb 2>/dev/null || true
killall -9 java 2>/dev/null || true
sleep 1
echo "✅ Done"
echo ""

# Step 2: Check ADB status
echo "[2/10] Testing ADB..."
adb kill-server 2>/dev/null || true
sleep 1
adb start-server 2>&1 | head -3
ADB_OUTPUT=$(timeout 3 adb devices 2>&1 || echo "TIMEOUT")
echo "$ADB_OUTPUT" | head -5
if echo "$ADB_OUTPUT" | grep -q "TIMEOUT"; then
    echo "❌ ADB is hanging!"
else
    echo "✅ ADB responding"
fi
echo ""

# Step 3: Check environment variables
echo "[3/10] Checking Android environment..."
echo "ANDROID_HOME: ${ANDROID_HOME:-❌ NOT SET}"
echo "ANDROID_SDK_ROOT: ${ANDROID_SDK_ROOT:-❌ NOT SET}"
if [ -z "$ANDROID_HOME" ]; then
    export ANDROID_HOME=$HOME/Library/Android/sdk
    export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
    echo "⚠️  Set temporarily for this session"
fi
echo ""

# Step 4: Check Android SDK components
echo "[4/10] Checking Android SDK components..."
[ -d "$ANDROID_HOME/platform-tools" ] && echo "✅ platform-tools" || echo "❌ platform-tools MISSING"
[ -d "$ANDROID_HOME/tools" ] && echo "✅ tools" || echo "❌ tools MISSING"
[ -d "$ANDROID_HOME/cmdline-tools" ] && echo "✅ cmdline-tools" || echo "❌ cmdline-tools MISSING"
[ -f "$ANDROID_HOME/platform-tools/adb" ] && echo "✅ adb executable" || echo "❌ adb MISSING"
echo ""

# Step 5: Check Android licenses
echo "[5/10] Checking Android licenses..."
if [ -d "$HOME/.android/licenses" ]; then
    LICENSE_COUNT=$(ls -1 "$HOME/.android/licenses" 2>/dev/null | wc -l)
    echo "Found $LICENSE_COUNT license(s)"
    if [ "$LICENSE_COUNT" -eq 0 ]; then
        echo "⚠️  No licenses found - may cause hangs"
    fi
else
    echo "⚠️  No licenses directory - may cause hangs"
fi
echo ""

# Step 6: Check network/proxy settings
echo "[6/10] Checking network settings..."
echo "HTTP_PROXY: ${HTTP_PROXY:-not set}"
echo "HTTPS_PROXY: ${HTTPS_PROXY:-not set}"
echo "NO_PROXY: ${NO_PROXY:-not set}"
echo "FLUTTER_ANALYTICS_DISABLED: ${FLUTTER_ANALYTICS_DISABLED:-not set}"
if [ -n "$HTTP_PROXY" ] || [ -n "$HTTPS_PROXY" ]; then
    echo "⚠️  Proxy detected - may cause network hangs"
fi
echo ""

# Step 7: Disable analytics and test Flutter doctor
echo "[7/10] Testing Flutter doctor (10 second timeout)..."
export FLUTTER_ANALYTICS_DISABLED=true
export PUB_HOSTED_URL=https://pub.dev
export FLUTTER_STORAGE_BASE_URL=https://storage.googleapis.com

DOCTOR_OUTPUT=$(timeout 10 fvm flutter doctor -v 2>&1 || echo "TIMEOUT_AFTER_10_SEC")
if echo "$DOCTOR_OUTPUT" | grep -q "TIMEOUT"; then
    echo "❌ Flutter doctor HANGING"
    echo "Last output before hang:"
    echo "$DOCTOR_OUTPUT" | tail -10
else
    echo "✅ Flutter doctor completed"
    echo "$DOCTOR_OUTPUT" | head -30
fi
echo ""

# Step 8: Test Flutter devices
echo "[8/10] Testing Flutter devices (5 second timeout)..."
DEVICES_OUTPUT=$(timeout 5 fvm flutter devices 2>&1 || echo "TIMEOUT_AFTER_5_SEC")
if echo "$DEVICES_OUTPUT" | grep -q "TIMEOUT"; then
    echo "❌ Flutter devices HANGING"
    echo "Last output before hang:"
    echo "$DEVICES_OUTPUT" | tail -5
else
    echo "✅ Flutter devices completed"
    echo "$DEVICES_OUTPUT"
fi
echo ""

# Step 9: Check Flutter cache
echo "[9/10] Checking Flutter cache..."
if [ -d "$HOME/.flutter" ]; then
    CACHE_SIZE=$(du -sh "$HOME/.flutter" 2>/dev/null | cut -f1)
    echo "Cache size: $CACHE_SIZE"
    [ -d "$HOME/.flutter/bin/cache" ] && echo "✅ Cache exists" || echo "❌ Cache corrupted"
else
    echo "⚠️  No Flutter cache found"
fi
echo ""

# Step 10: Summary and recommendations
echo "[10/10] Diagnostic Summary"
echo "=========================================="
echo ""
echo "RECOMMENDATIONS:"
echo ""

if echo "$DOCTOR_OUTPUT" | grep -q "TIMEOUT"; then
    echo "1. Flutter doctor is hanging - likely causes:"
    echo "   - Android license check hanging"
    echo "   - Network connectivity issues"
    echo "   - Corrupted Flutter cache"
    echo ""
    echo "   Try: fvm flutter doctor --android-licenses"
    echo "   Or: rm -rf ~/.flutter && fvm flutter doctor"
fi

if echo "$DEVICES_OUTPUT" | grep -q "TIMEOUT"; then
    echo "2. Flutter devices is hanging - likely causes:"
    echo "   - ADB daemon issues"
    echo "   - Unauthorized device"
    echo "   - Network timeout"
    echo ""
    echo "   Try: adb kill-server && adb start-server"
    echo "   Then authorize device on phone"
fi

if [ -z "$ANDROID_HOME" ] || [ -z "$ANDROID_SDK_ROOT" ]; then
    echo "3. Set environment variables permanently:"
    echo "   Add to ~/.zshrc:"
    echo "   export ANDROID_HOME=\$HOME/Library/Android/sdk"
    echo "   export ANDROID_SDK_ROOT=\$HOME/Library/Android/sdk"
fi

echo ""
echo "=========================================="

