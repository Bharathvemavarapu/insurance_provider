import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    throw UnsupportedError(
      'DefaultFirebaseOptions have not been configured for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDgfpCLbQpjHx_IBx3uQgeFeG9NvXrpagk',
    authDomain: 'nova-insurance-a6aad.firebaseapp.com',
    databaseURL: 'https://nova-insurance-a6aad-default-rtdb.firebaseio.com',
    projectId: 'nova-insurance-a6aad',
    storageBucket: 'nova-insurance-a6aad.firebasestorage.app',
    messagingSenderId: '644456873282',
    appId: '1:644456873282:web:e4fe4be5ddda6db3639cdb',
    measurementId: 'G-D62ZSSZZPK',
  );
}
