import '../../../core/utils/data_class.dart';
import '../../entities/login_entity.dart';
import '../../repositories/auth_repository.dart';

class LoginUseCase {
  LoginUseCase(this._repository);
  final AuthRepository _repository;

  Future<DataState<TokenInfoEntity>> call() {
    return _repository.login();
  }
}