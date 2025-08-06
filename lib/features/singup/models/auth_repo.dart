import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

abstract class AtuthRpo {}

class AuthRepo {
  //
  //
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> SingUpWithEmailandPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(name);
      //
      return credential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('Faide To Sing Up : >>>>>>>>>>>>>>>>>>>>${e.toString()}');
    }
    return null;
  }

  Future<User?> singInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint(
        'Faide To Sing IN : <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<${e.toString()}',
      );
    }
    return null;
  }

  Future<void> singOut() async {
    await _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
