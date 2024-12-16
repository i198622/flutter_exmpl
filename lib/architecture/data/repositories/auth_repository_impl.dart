import '../../core/failures/failures.dart';
import '../../core/utils/data_class.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../providers/api/api_provider.dart';

class AuthRepositoryImpl extends AuthRepository {
  final ApiProvider _apiProvider;

  AuthRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<TokenInfoEntity>> login() async {
    try {
      final model = await _apiProvider.login();
      return DataSuccess(model.toEntity());
    } catch(e) {
      return DataFailed(UnknownFailure());
    }
  }
}