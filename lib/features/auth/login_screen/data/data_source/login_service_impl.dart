//

import 'package:epsilon_app/core/exceptions/app_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:epsilon_app/features/auth/login_screen/data/data_source/login_service.dart';

class LoginServiceImpl implements LoginService {
  final http.Client client;

  const LoginServiceImpl({required this.client});
  @override
  Future<String> login(
      {required String username, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));
    if (username == 'aaaa' && password == 'aaaa') {
      return 'it is ok';
    } else {
      throw InvalidUsernameOrPasswordException();
    }
  }
}
