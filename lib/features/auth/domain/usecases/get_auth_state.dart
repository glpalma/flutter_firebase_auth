import 'package:flutter_firebase_auth/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_firebase_auth/features/auth/domain/repositories/auth_repository.dart';

class GetAuthState {
  final AuthRepository _authRepository;

  GetAuthState({required AuthRepository repository})
    : _authRepository = repository;

  Stream<UserEntity?> call() {
    return _authRepository.getAuthStateChanges();
  }
}
