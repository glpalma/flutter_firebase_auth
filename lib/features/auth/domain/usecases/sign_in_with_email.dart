import 'package:flutter_firebase_auth/core/usecases/usecase.dart';
import 'package:flutter_firebase_auth/features/auth/domain/repositories/auth_repository.dart';

class SignInParams {
  final String email;
  final String password;
  const SignInParams({required this.email, required this.password});
}

class SignInWithEmail extends UseCase<void, SignInParams> {
  final AuthRepository _authRepository;

  SignInWithEmail({required AuthRepository repository})
    : _authRepository = repository;

  @override
  Future<void> call(SignInParams params) {
    return _authRepository.signInWithEmail(params.email, params.password);
  }
}
