//

import 'package:http/http.dart' as http;
import 'package:epsilon_app/features/auth/login_screen/data/data_source/login_service.dart';

class LoginServiceImpl implements LoginService {
  final http.Client client;

  const LoginServiceImpl({required this.client});
  @override
  Future<String> login(
      {required String email, required String password}) async {
    return 'it is ok';
  }
}
