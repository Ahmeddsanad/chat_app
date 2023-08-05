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
    apiKey: 'AIzaSyDe9uH-_utIPt7zV5AqDEN0TRG9fFJ8Y6c',
    appId: '1:976904436839:web:b164ab6afb28e3feb068c2',
    messagingSenderId: '976904436839',
    projectId: 'chat-app-293b8',
    authDomain: 'chat-app-293b8.firebaseapp.com',
    storageBucket: 'chat-app-293b8.appspot.com',
    measurementId: 'G-MCZK045NE0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4ouknio10SfMdKONAUJjzK5hRNB6LyWk',
    appId: '1:976904436839:android:2d64ad70dc04c279b068c2',
    messagingSenderId: '976904436839',
    projectId: 'chat-app-293b8',
    storageBucket: 'chat-app-293b8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAP4M-fBZnmTozbRsGDcNhuzQofhoAUBVw',
    appId: '1:976904436839:ios:aab3eae64aa42f31b068c2',
    messagingSenderId: '976904436839',
    projectId: 'chat-app-293b8',
    storageBucket: 'chat-app-293b8.appspot.com',
    iosClientId: '976904436839-ktjf41349ag83vh1skrfcpr06dla147v.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAP4M-fBZnmTozbRsGDcNhuzQofhoAUBVw',
    appId: '1:976904436839:ios:df65d365acf3c19eb068c2',
    messagingSenderId: '976904436839',
    projectId: 'chat-app-293b8',
    storageBucket: 'chat-app-293b8.appspot.com',
    iosClientId: '976904436839-j297naahjoiuk1gup5b4c7l88odshf1i.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}