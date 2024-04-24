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
    apiKey: 'AIzaSyDD0cQJ05cIaUp2YVoFwop3UNgm4PtlNqo',
    appId: '1:3520534618:web:a09ab6a9e78039c20da063',
    messagingSenderId: '3520534618',
    projectId: 'rightbin-fef55',
    authDomain: 'rightbin-fef55.firebaseapp.com',
    storageBucket: 'rightbin-fef55.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKX7tpz3IXQRpnEtI2ikLWEUjyYJAhTHM',
    appId: '1:3520534618:android:c8f349646b6db8650da063',
    messagingSenderId: '3520534618',
    projectId: 'rightbin-fef55',
    storageBucket: 'rightbin-fef55.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCh1FkK3fAuUMQmodo8pzlV80Z5XHr-PQA',
    appId: '1:3520534618:ios:3f0d486d478c734e0da063',
    messagingSenderId: '3520534618',
    projectId: 'rightbin-fef55',
    storageBucket: 'rightbin-fef55.appspot.com',
    iosClientId: '3520534618-3hk1kdtsa3ug3p9nuivrnulb7nt1g1uc.apps.googleusercontent.com',
    iosBundleId: 'com.example.rightbin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCh1FkK3fAuUMQmodo8pzlV80Z5XHr-PQA',
    appId: '1:3520534618:ios:3f0d486d478c734e0da063',
    messagingSenderId: '3520534618',
    projectId: 'rightbin-fef55',
    storageBucket: 'rightbin-fef55.appspot.com',
    iosClientId: '3520534618-3hk1kdtsa3ug3p9nuivrnulb7nt1g1uc.apps.googleusercontent.com',
    iosBundleId: 'com.example.rightbin',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDD0cQJ05cIaUp2YVoFwop3UNgm4PtlNqo',
    appId: '1:3520534618:web:f6f9d03be50b9bd20da063',
    messagingSenderId: '3520534618',
    projectId: 'rightbin-fef55',
    authDomain: 'rightbin-fef55.firebaseapp.com',
    storageBucket: 'rightbin-fef55.appspot.com',
  );
}