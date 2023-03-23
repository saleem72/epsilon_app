//

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> login(
      {required String username, required String password});
}
