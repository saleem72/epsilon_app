//

import 'dtos/login_data.dart';

abstract class LoginService {
  Future<LoginData> login({required String username, required String password});
}
