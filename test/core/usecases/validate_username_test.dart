//

import 'package:epsilon_app/core/usecases/validate_username.dart';
import 'package:epsilon_app/core/usecases/validation_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  late ValidateUsername validator;
  setUp(() {
    validator = ValidateUsername();
  });

  group('ValidateUsername Behaviour', () {
    test('Should return [ValidationStatus.valid] when user name is valid', () {
      // arrange
      const tUsername = 'uyuoiu';

      //act
      final result = validator.call(tUsername);

      // assert
      expect(result, ValidationStatus.valid);
    });

    test(
        'Should return [ValidationStatus.emptyUsername] when user name is empty or just spaces',
        () {
      // arrange
      const tUsername = '   ';

      //act
      final result = validator.call(tUsername);

      // assert
      expect(result, ValidationStatus.emptyUsername);
    });

    test(
        'Should return [ValidationStatus.shortUsername] when user name is valid',
        () {
      // arrange
      const tUsername = 'uy';

      //act
      final result = validator.call(tUsername);

      // assert
      expect(result, ValidationStatus.shortUsername);
    });
  });
}
