//

import 'package:epsilon_app/core/usecases/validate_password.dart';
import 'package:epsilon_app/core/usecases/validate_username.dart';
import 'package:epsilon_app/core/usecases/validation_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  late ValidatePassword validator;
  setUp(() {
    validator = ValidatePassword();
  });

  group('Validate Password Behaviour', () {
    test('Should return [ValidationStatus.valid] when password is valid', () {
      // arrange
      const tUsername = 'uyuoiu';

      //act
      final result = validator.call(tUsername);

      // assert
      expect(result, ValidationStatus.valid);
    });

    test(
        'Should return [ValidationStatus.emptyPassword] when password is empty or just spaces',
        () {
      // arrange
      const tUsername = '';

      //act
      final result = validator.call(tUsername);

      // assert
      expect(result, ValidationStatus.emptyPassword);
    });

    test(
        'Should return [ValidationStatus.shortPassword] when password is valid',
        () {
      // arrange
      const tUsername = 'uy';

      //act
      final result = validator.call(tUsername);

      // assert
      expect(result, ValidationStatus.shortPassword);
    });
  });
}
