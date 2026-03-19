import 'package:flutter_firebase_auth/core/usecases/usecase.dart';
import 'package:flutter_firebase_auth/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_firebase_auth/features/auth/domain/usecases/sign_in_with_email.dart';

class SignUpWithEmail extends UseCase<void, SignInParams> {
  final AuthRepository _authRepository;

  SignUpWithEmail({required AuthRepository repository})
      : _authRepository = repository;

  @override
  Future<void> call(SignInParams params) {
    return _authRepository.createUserWithEmail(params.email, params.password);
  }
}
