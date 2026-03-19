import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:flutter_firebase_auth/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_firebase_auth/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDatasource _firebaseDatasource;

  AuthRepositoryImpl({required FirebaseAuthDatasource firebaseDatasource})
    : _firebaseDatasource = firebaseDatasource;

  @override
  Future<void> signOut() {
    return _firebaseDatasource.signOut();
  }

  @override
  Future<void> signInWithEmail(String email, String password) {
    return _firebaseDatasource.signInWithEmail(email, password);
  }

  @override
  Future<void> createUserWithEmail(String email, String password) {
    return _firebaseDatasource.createUserWithEmail(email, password);
  }

  @override
  Stream<UserEntity?> getAuthStateChanges() {
    return _firebaseDatasource.getAuthStateChanges().map(
      (event) => event?.toEntity(),
    );
  }
}

extension on User? {
  // TODO: move to a better place
  UserEntity? toEntity() {
    assert(this != null && this!.email != null, 'User email is required');
    return this != null
        ? UserEntity(uid: this!.uid, email: this!.email!)
        : null;
  }
}
