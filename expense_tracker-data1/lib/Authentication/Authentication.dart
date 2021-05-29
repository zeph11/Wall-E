import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class UserClass {
  UserClass(
      {@required this.id,
      @required this.displayName,
      @required this.email,
      @required this.photoUrl,
      @required this.isEmailVerified});
  final String id;
  final String photoUrl;
  final String email;
  final String displayName;
  final bool isEmailVerified;
}

abstract class AuthBase {
  Stream<UserClass> get onAuthStateChanged;

  Future<UserClass> createEmailPassword(String email, String password);

  Future<UserClass> signInWithEmailPassword(String email, String password);
  Future<UserClass> currentUser();

  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  UserClass _userFromFirebase(User user) {
    if (user == null) {
      return null;
    }
    return UserClass(
        id: user.uid,
        photoUrl: user.photoURL,
        email: user.email,
        displayName: user.displayName,
        isEmailVerified: user.emailVerified);
  }

  @override
  Future<UserClass> currentUser() async {
    final user = _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  @override
  Stream<UserClass> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  @override
  Future<void> signOut() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  @override
  Future<UserClass> signInWithEmailPassword(
      String email, String password) async {
    final authResults = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResults.user);
  }

  @override
  Future<UserClass> createEmailPassword(String email, String password) async {
    final authResults = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResults.user);
  }
}
