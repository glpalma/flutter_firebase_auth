import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_auth/core/usecases/usecase.dart';
import 'package:flutter_firebase_auth/features/auth/domain/usecases/sign_in_with_email.dart';

import '../../domain/usecases/sign_in_with_google.dart';

class LoginViewModel extends ChangeNotifier {
  final SignInWithEmail _signInWithEmail;
  final SignInWithGoogle _signInWithGoogle;

  LoginViewModel({required SignInWithEmail signInWithEmail, required SignInWithGoogle signInWithGoogle})
      : _signInWithEmail = signInWithEmail,
      _signInWithGoogle = signInWithGoogle;

  bool isLoading = false;
  String? errorMessage;

  Future<void> signInWithEmail(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _signInWithEmail.call(
        SignInParams(email: email, password: password),
      );
    } catch (e) {
      errorMessage = e.toString();
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithGoogle() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _signInWithGoogle.call(NoParams());
    } catch (e) {
      errorMessage = e.toString();
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
