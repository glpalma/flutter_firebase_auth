import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDatasource {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthDatasource({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

    Future<void> signInWithEmail(String email, String password) {
      return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }

    Future<void> signOut() {
      return _firebaseAuth.signOut();
    }

    Future<void> createUserWithEmail(String email, String password) {
      return _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    }

    Stream<User?> getAuthStateChanges() {
      return _firebaseAuth.authStateChanges();
    }
}
