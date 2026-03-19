import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_auth/core/error/failures.dart';
import 'package:flutter_firebase_auth/features/auth/domain/usecases/sign_in_with_email.dart';
import 'package:flutter_firebase_auth/features/auth/domain/usecases/sign_up_with_email.dart';

class SignupViewModel extends ChangeNotifier {
  final SignUpWithEmail _signUpWithEmail;

  SignupViewModel({required SignUpWithEmail signUpWithEmail})
      : _signUpWithEmail = signUpWithEmail;

  bool isLoading = false;
  String? errorMessage;

  Future<void> signUpWithEmail(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _signUpWithEmail.call(
        SignInParams(email: email, password: password),
      );
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
