//

import 'dtos/login_data_dto.dart';

abstract class LoginService {
  Future<String> login({required String username, required String password});
}
