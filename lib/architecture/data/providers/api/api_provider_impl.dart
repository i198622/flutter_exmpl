import '../../models/auth_model.dart';
import 'api_provider.dart';

class ApiProviderImpl extends ApiProvider {
  @override
  Future<LoginResponseModel> login() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return LoginResponseModel(
        accessToken: 'token',
        refreshToken: 'token',
      );
    } catch (e) {
      rethrow;
    }
  }
}
