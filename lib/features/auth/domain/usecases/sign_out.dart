import 'package:flutter_firebase_auth/core/usecases/usecase.dart';
import 'package:flutter_firebase_auth/features/auth/domain/repositories/auth_repository.dart';

class SignOut extends UseCase<void, NoParams> {
  final AuthRepository _authRepository;

  SignOut({required AuthRepository repository}) : _authRepository = repository;

  @override
  Future<void> call(NoParams _) {
    return _authRepository.signOut();
  }
}
