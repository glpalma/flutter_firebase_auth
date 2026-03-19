import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_auth/core/error/failures.dart';
import 'package:flutter_firebase_auth/features/auth/domain/usecases/sign_in_with_email.dart';

class LoginViewModel extends ChangeNotifier {
  final SignInWithEmail _signInWithEmail;

  LoginViewModel({required SignInWithEmail signInWithEmail})
    : _signInWithEmail = signInWithEmail;

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
    } on AuthFailure catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
