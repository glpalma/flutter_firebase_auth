import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/core/di/injection_container.dart';
import 'package:flutter_firebase_auth/features/auth/ui/login/login_viewmodel.dart';
import 'package:flutter_firebase_auth/features/auth/ui/signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginViewModel _viewModel;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _viewModel = sl<LoginViewModel>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListenableBuilder(
            listenable: _viewModel,
            builder: (context, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _viewModel.signInWithEmail(
                      _emailController.text.trim(),
                      _passwordController.text,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (_viewModel.errorMessage != null)
                    Text(
                      _viewModel.errorMessage!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 24),
                  _viewModel.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: () => _viewModel.signInWithEmail(
                            _emailController.text.trim(),
                            _passwordController.text,
                          ),
                          child: const Text('Sign In'),
                        ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: _viewModel.isLoading
                        ? null
                        : () => _viewModel.signInWithGoogle(),
                    child: const Text('Sign in with Google'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const SignupScreen(),
                      ),
                    ),
                    child: const Text("Don't have an account? Sign up"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
