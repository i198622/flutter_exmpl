import '../../core/utils/data_class.dart';
import '../entities/login_entity.dart';

abstract class AuthRepository {
  Future<DataState<TokenInfoEntity>> login();
}