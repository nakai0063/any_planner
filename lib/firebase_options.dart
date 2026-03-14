// PLACEHOLDER — Run `flutterfire configure --project=any-planner-personal` to replace this file.
// After running the command, this file will be overwritten with your actual Firebase credentials.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not configured for this platform. '
          'Run `flutterfire configure` to generate platform-specific options.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDULODan-cB9bMOnBq3dNwxaKCYiKRBeYQ',
    appId: '1:580892580621:android:79ed13b6b015fe18656e44',
    messagingSenderId: '580892580621',
    projectId: 'my-pllaner',
    storageBucket: 'my-pllaner.firebasestorage.app',
  );

  // TODO: Replace all values below by running `flutterfire configure`
}