import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges();
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on auth.FirebaseAuthException catch (e) {
      // TODO: treat exceptions
      return null;
    }
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on auth.FirebaseAuthException catch (e) {
      // TODO: treat exceptions
      return null;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
