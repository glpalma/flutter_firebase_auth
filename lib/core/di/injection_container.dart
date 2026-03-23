import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../features/auth/data/datasources/firebase_auth_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/get_auth_state.dart';
import '../../features/auth/domain/usecases/sign_in_with_email.dart';
import '../../features/auth/domain/usecases/sign_in_with_google.dart';
import '../../features/auth/domain/usecases/sign_out.dart';
import '../../features/auth/ui/auth_viewmodel.dart';
import '../../features/auth/ui/login/login_viewmodel.dart';
import '../../features/auth/ui/signup/signup_viewmodel.dart';

final GetIt sl = GetIt.instance;

const String _googleWebServerClientId =
    '349320741795-gtjjf6pt81oastilp7p31iip7vf7psse.apps.googleusercontent.com';

Future<void> setupDependencies() async {
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  await GoogleSignIn.instance.initialize(
    serverClientId: _googleWebServerClientId,
  );
  sl.registerLazySingleton(() => GoogleSignIn.instance);

  // Datasources
  sl.registerLazySingleton<FirebaseAuthDatasource>(
    () => FirebaseAuthDatasource(firebaseAuth: sl(), googleSignIn: sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(firebaseDatasource: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => SignInWithEmail(repository: sl()));
  sl.registerLazySingleton(() => SignInWithGoogle(repository: sl()));
  sl.registerLazySingleton(() => SignOut(repository: sl()));
  sl.registerLazySingleton(() => GetAuthState(repository: sl()));

  // ViewModels
  sl.registerLazySingleton(
    () => AuthViewModel(getAuthState: sl(), signOut: sl()),
  );
  sl.registerFactory(
    () => LoginViewModel(signInWithEmail: sl(), signInWithGoogle: sl()),
  );
  sl.registerFactory(() => SignupViewModel(signUpWithEmail: sl()));
}
