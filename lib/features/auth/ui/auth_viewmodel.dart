import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_auth/core/usecases/usecase.dart';
import 'package:flutter_firebase_auth/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_firebase_auth/features/auth/domain/usecases/get_auth_state.dart';
import 'package:flutter_firebase_auth/features/auth/domain/usecases/sign_out.dart';

class AuthViewModel extends ChangeNotifier {
  final GetAuthState _getAuthState;
  final SignOut _signOut;

  AuthViewModel({required GetAuthState getAuthState, required SignOut signOut})
    : _getAuthState = getAuthState,
      _signOut = signOut {
    _getAuthState().listen((user) {
      _currentUser = user;
      notifyListeners();
    });
  }

  UserEntity? _currentUser;
  UserEntity? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;
  bool isLoading = false;

  Future<void> signOut() async {
    _signOut.call(NoParams());
  }
}
