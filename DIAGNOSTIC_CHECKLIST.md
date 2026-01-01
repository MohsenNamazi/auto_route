# Flutter Devices Hanging - Diagnostic Checklist

## 🔍 Root Cause Analysis

### Primary Issue: **Device Unauthorized**
- Your Android device (3B201JEHN13874) is connected but shows as "unauthorized"
- This causes `flutter devices` to hang waiting for authorization

### Secondary Issues Found:
1. ✅ ADB is installed and working (`/opt/homebrew/bin/adb`)
2. ✅ Android SDK found at `/Users/mohsen.namazi/Library/Android/sdk`
3. ❌ Environment variables NOT set (ANDROID_HOME, ANDROID_SDK_ROOT)
4. ✅ FVM configured (Flutter 3.27.4)
5. ✅ Stuck processes killed

---

## 🛠️ Step-by-Step Fix

### Step 1: Authorize Your Device (CRITICAL)

**On your Android phone:**
1. Unlock your phone
2. Look for a popup: **"Allow USB debugging?"**
3. Check the box: **"Always allow from this computer"**
4. Tap **"Allow"**

**If no popup appears:**
```bash
# Revoke all authorizations and reconnect
adb kill-server
adb start-server
# Unplug and replug USB cable
# Check phone again for popup
```

### Step 2: Set Environment Variables (Permanent Fix)

Add to your `~/.zshrc` file:
```bash
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
```

Then reload:
```bash
source ~/.zshrc
```

### Step 3: Verify Device Authorization

```bash
adb devices
```

Should show:
```
List of devices attached
3B201JEHN13874	device    # ✅ "device" not "unauthorized"
```

### Step 4: Test Flutter Devices

```bash
cd /Users/mohsen.namazi/Desktop/auto_route
fvm flutter devices
```

Should list your device without hanging.

---

## 🔧 Quick Commands Reference

### Kill Stuck Processes
```bash
killall -9 dart
killall -9 adb
```

### Restart ADB
```bash
adb kill-server
adb start-server
adb devices
```

### Check ADB Status
```bash
adb devices
# Should show: device (not unauthorized or offline)
```

### Check Environment Variables
```bash
echo $ANDROID_HOME
echo $ANDROID_SDK_ROOT
```

### Run Flutter with FVM
```bash
fvm flutter devices
fvm flutter run
```

---

## 📋 Diagnostic Checklist

Use this checklist to verify everything is working:

- [ ] **ADB working**: `adb devices` returns quickly (not hanging)
- [ ] **Device authorized**: Shows "device" not "unauthorized" or "offline"
- [ ] **Environment variables set**: `echo $ANDROID_HOME` shows path
- [ ] **No stuck processes**: `ps aux | grep flutter` shows minimal processes
- [ ] **ADB server running**: `adb devices` doesn't show "daemon not running"
- [ ] **Flutter devices works**: `fvm flutter devices` completes in < 5 seconds
- [ ] **FVM configured**: `.fvm/` directory exists with `fvm_config.json`

---

## 🚨 Common Issues & Solutions

### Issue: "unauthorized" device
**Solution**: Authorize on phone (Step 1 above)

### Issue: ADB hangs
**Solution**: 
```bash
adb kill-server
adb start-server
```

### Issue: Flutter devices hangs
**Solution**: 
1. Kill stuck processes: `killall -9 dart`
2. Restart ADB: `adb kill-server && adb start-server`
3. Authorize device on phone
4. Set environment variables

### Issue: "ANDROID_HOME not set"
**Solution**: Add to `~/.zshrc` (see Step 2)

### Issue: Multiple Flutter installations conflicting
**Solution**: Use FVM consistently: `fvm flutter <command>`

---

## ✅ Success Criteria

You'll know it's fixed when:
1. `adb devices` shows your device as "device" (not unauthorized)
2. `fvm flutter devices` completes in < 5 seconds
3. Device appears in the output with a name/ID
4. `fvm flutter run` successfully launches on your device

---

## 📝 Notes

- FVM files (`.fvm/`) are now in `.gitignore` ✅
- Use `fvm flutter` instead of `flutter` for consistency
- If issues persist, try revoking USB debugging authorizations on phone and re-authorizing

