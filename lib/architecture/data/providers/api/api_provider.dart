import '../../models/auth_model.dart';

abstract class ApiProvider {
  Future<LoginResponseModel> login();
}