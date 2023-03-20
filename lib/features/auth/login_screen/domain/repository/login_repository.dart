//

import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> login(
      {required String email, required String password});
}
