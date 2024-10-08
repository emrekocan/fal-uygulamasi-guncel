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
    apiKey: 'AIzaSyBdnu7kdDL8HPzUuYYhcpXjSFQD4VHjJ5I',
    appId: '1:880535765023:web:698e4fbb1eba7693f0152a',
    messagingSenderId: '880535765023',
    projectId: 'falci-f0618',
    authDomain: 'falci-f0618.firebaseapp.com',
    storageBucket: 'falci-f0618.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3MQhbQf7lut5nBVCntsBmrYDmN9vNPts',
    appId: '1:880535765023:android:e464a85334aab4d9f0152a',
    messagingSenderId: '880535765023',
    projectId: 'falci-f0618',
    storageBucket: 'falci-f0618.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtlu9R1zPeKTAKHF13iNFzO4lba_Emt4s',
    appId: '1:880535765023:ios:113bc73e8d361d91f0152a',
    messagingSenderId: '880535765023',
    projectId: 'falci-f0618',
    storageBucket: 'falci-f0618.appspot.com',
    iosBundleId: 'com.example.deneme1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtlu9R1zPeKTAKHF13iNFzO4lba_Emt4s',
    appId: '1:880535765023:ios:113bc73e8d361d91f0152a',
    messagingSenderId: '880535765023',
    projectId: 'falci-f0618',
    storageBucket: 'falci-f0618.appspot.com',
    iosBundleId: 'com.example.deneme1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBdnu7kdDL8HPzUuYYhcpXjSFQD4VHjJ5I',
    appId: '1:880535765023:web:1f8efc4776663ad7f0152a',
    messagingSenderId: '880535765023',
    projectId: 'falci-f0618',
    authDomain: 'falci-f0618.firebaseapp.com',
    storageBucket: 'falci-f0618.appspot.com',
  );
}
