//

import 'package:dartz/dartz.dart';
import 'package:epsilon_app/features/auth/login_screen/domain/failures/login_failure.dart';

abstract class LoginRepository {
  Future<Either<LoginFailure, String>> login(
      {required String username, required String password});
}
