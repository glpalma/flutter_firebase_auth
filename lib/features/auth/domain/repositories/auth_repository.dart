import 'package:flutter_firebase_auth/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> signInWithEmail(String email, String password);
  Future<void> createUserWithEmail(String email, String password);
  Future<void> signOut();
  Stream<UserEntity?> getAuthStateChanges();
}