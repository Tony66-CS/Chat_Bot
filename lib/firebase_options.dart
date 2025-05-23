// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDsp79hqXwLTjZf0Fywktc-ug8SQSCs0eI',
    appId: '1:14949512733:web:0febd635492afbbbbdb8f4',
    messagingSenderId: '14949512733',
    projectId: 'project1-b98bb',
    authDomain: 'project1-b98bb.firebaseapp.com',
    storageBucket: 'project1-b98bb.firebasestorage.app',
    measurementId: 'G-41NPKP2Y41',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCzV4DZu6v80cx14_CE2ZiWKuI-g4AOfLQ',
    appId: '1:14949512733:android:a0805851e0560c33bdb8f4',
    messagingSenderId: '14949512733',
    projectId: 'project1-b98bb',
    storageBucket: 'project1-b98bb.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAiHh4zaNx_jXgeEpy2xCgFcWd28suOpxA',
    appId: '1:14949512733:ios:d5b66ffa16318109bdb8f4',
    messagingSenderId: '14949512733',
    projectId: 'project1-b98bb',
    storageBucket: 'project1-b98bb.firebasestorage.app',
    iosBundleId: 'com.example.tonyyyyyy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAiHh4zaNx_jXgeEpy2xCgFcWd28suOpxA',
    appId: '1:14949512733:ios:d5b66ffa16318109bdb8f4',
    messagingSenderId: '14949512733',
    projectId: 'project1-b98bb',
    storageBucket: 'project1-b98bb.firebasestorage.app',
    iosBundleId: 'com.example.tonyyyyyy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDsp79hqXwLTjZf0Fywktc-ug8SQSCs0eI',
    appId: '1:14949512733:web:cf7c3bd7e5373198bdb8f4',
    messagingSenderId: '14949512733',
    projectId: 'project1-b98bb',
    authDomain: 'project1-b98bb.firebaseapp.com',
    storageBucket: 'project1-b98bb.firebasestorage.app',
    measurementId: 'G-3C06FBN025',
  );
}
