// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDgw5053fW6WKnKRnam-gVh_f2ZJBer-iw',
    appId: '1:656194875447:android:e765e1d0847061c0f14fb2',
    messagingSenderId: '656194875447',
    projectId: 'fitnessx-a352c',
    storageBucket: 'fitnessx-a352c.appspot.com',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCs8UtKvqAAG3LCZF9FtyJoMtCJiPHT2lE',
    appId: '1:656194875447:web:eb3df41aed597468f14fb2',
    messagingSenderId: '656194875447',
    projectId: 'fitnessx-a352c',
    authDomain: 'fitnessx-a352c.firebaseapp.com',
    storageBucket: 'fitnessx-a352c.appspot.com',
    measurementId: 'G-L5Y3W33X5H',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDEAlvQa9euC1eVj_ftXkg6N_-7K6b5b5Q',
    appId: '1:656194875447:ios:807331b02b439b35f14fb2',
    messagingSenderId: '656194875447',
    projectId: 'fitnessx-a352c',
    storageBucket: 'fitnessx-a352c.appspot.com',
    iosClientId: '656194875447-vpti2vndre2ca4a9tfoq1a5sol9usvu8.apps.googleusercontent.com',
    iosBundleId: 'com.example.fit',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDEAlvQa9euC1eVj_ftXkg6N_-7K6b5b5Q',
    appId: '1:656194875447:ios:807331b02b439b35f14fb2',
    messagingSenderId: '656194875447',
    projectId: 'fitnessx-a352c',
    storageBucket: 'fitnessx-a352c.appspot.com',
    iosClientId: '656194875447-vpti2vndre2ca4a9tfoq1a5sol9usvu8.apps.googleusercontent.com',
    iosBundleId: 'com.example.fit',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCs8UtKvqAAG3LCZF9FtyJoMtCJiPHT2lE',
    appId: '1:656194875447:web:9b3727a1b0a53b27f14fb2',
    messagingSenderId: '656194875447',
    projectId: 'fitnessx-a352c',
    authDomain: 'fitnessx-a352c.firebaseapp.com',
    storageBucket: 'fitnessx-a352c.appspot.com',
    measurementId: 'G-6MK92L9MBT',
  );

}