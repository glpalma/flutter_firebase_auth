import 'package:flutter_firebase_auth/core/usecases/usecase.dart';
import 'package:flutter_firebase_auth/features/auth/domain/repositories/auth_repository.dart';

class SignInWithGoogle extends UseCase<void, NoParams> {
  final AuthRepository repository;

  SignInWithGoogle({required this.repository});

  @override
  Future<void> call(NoParams params) {
    return repository.signInWithGoogle();
  }
}
