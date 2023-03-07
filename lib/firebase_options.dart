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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAzkOcxNwdhixPBrp_ayswETRW5OUN9Esc',
    appId: '1:589162289045:web:82d11c3838c14c27e9089c',
    messagingSenderId: '589162289045',
    projectId: 'flutter-viajes',
    authDomain: 'flutter-viajes.firebaseapp.com',
    storageBucket: 'flutter-viajes.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqRfaKd2WMFK0qTjZOhCJ685T93POIjtg',
    appId: '1:589162289045:android:ebaaf798c7d46684e9089c',
    messagingSenderId: '589162289045',
    projectId: 'flutter-viajes',
    storageBucket: 'flutter-viajes.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4JjLAb_8ISXd62fPpipIkhCnego11plM',
    appId: '1:589162289045:ios:a4975337405cac84e9089c',
    messagingSenderId: '589162289045',
    projectId: 'flutter-viajes',
    storageBucket: 'flutter-viajes.appspot.com',
    iosClientId: '589162289045-flou1b4km0fripgjv3m7kskmn8n9vkkq.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAvanzadoViajes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4JjLAb_8ISXd62fPpipIkhCnego11plM',
    appId: '1:589162289045:ios:a4975337405cac84e9089c',
    messagingSenderId: '589162289045',
    projectId: 'flutter-viajes',
    storageBucket: 'flutter-viajes.appspot.com',
    iosClientId: '589162289045-flou1b4km0fripgjv3m7kskmn8n9vkkq.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAvanzadoViajes',
  );
}
