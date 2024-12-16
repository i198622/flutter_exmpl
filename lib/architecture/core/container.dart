import 'package:get_it/get_it.dart';

import '../data/providers/api/api_provider_impl.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/usecases/auth/login_usecase.dart';
import '../presentation/blocs/auth/auth_cubit.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  // Providers
  locator.registerSingleton<ApiProviderImpl>(ApiProviderImpl());

  // Repositories
  locator.registerSingleton<AuthRepositoryImpl>(AuthRepositoryImpl(locator<ApiProviderImpl>()));
  
  // UseCases
  locator.registerSingleton<LoginUseCase>(LoginUseCase(locator<AuthRepositoryImpl>()));

  // Bloc
  locator.registerSingleton<AuthCubit>(AuthCubit(locator<LoginUseCase>()));
}