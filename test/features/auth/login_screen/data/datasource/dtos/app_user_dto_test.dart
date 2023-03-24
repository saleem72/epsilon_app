//

import 'dart:convert';

import 'package:epsilon_app/features/auth/login_screen/data/data_source/dtos/app_user_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../fixtures/fixture_reader.dart';

void main() {
  group('AppUserDTO Behaviour', () {
    test('Should return [AppUserDTO] from map when the map is valid', () {
      // arrangle
      final tSuccessFixture = fixture('user_dto_good.json');
      final tMap = json.decode(tSuccessFixture);

      // act
      final userDTO = AppUserDTO.fromJson(tMap);

      //
      expect(userDTO, isA<AppUserDTO>());
    });

    test(
      'should throw [TypeError] when map is invalid',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('user_dto_bad.json'));
        // act

        // assert
        expect(() => AppUserDTO.fromJson(jsonMap),
            throwsA(const TypeMatcher<TypeError>()));
      },
    );
  });
}
