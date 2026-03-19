import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasources/firebase_auth_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/get_auth_state.dart';
import '../../features/auth/domain/usecases/sign_in_with_email.dart';
import '../../features/auth/domain/usecases/sign_out.dart';
import '../../features/auth/domain/usecases/sign_up_with_email.dart';
import '../../features/auth/ui/auth_viewmodel.dart';
import '../../features/auth/ui/login/login_viewmodel.dart';
import '../../features/auth/ui/signup/signup_viewmodel.dart';

final GetIt sl = GetIt.instance;

void setupDependencies() {
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // Datasources
  sl.registerLazySingleton<FirebaseAuthDatasource>(
    () => FirebaseAuthDatasource(firebaseAuth: sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(firebaseDatasource: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => SignInWithEmail(repository: sl()));
  sl.registerLazySingleton(() => SignUpWithEmail(repository: sl()));
  sl.registerLazySingleton(() => SignOut(repository: sl()));
  sl.registerLazySingleton(() => GetAuthState(repository: sl()));

  // ViewModels
  sl.registerLazySingleton(
    () => AuthViewModel(getAuthState: sl(), signOut: sl()),
  );
  sl.registerFactory(() => LoginViewModel(signInWithEmail: sl()));
  sl.registerFactory(() => SignupViewModel(signUpWithEmail: sl()));
}
