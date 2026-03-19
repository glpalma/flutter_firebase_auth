class AuthFailure implements Exception {
  const AuthFailure({required this.message});

  final String message;
}