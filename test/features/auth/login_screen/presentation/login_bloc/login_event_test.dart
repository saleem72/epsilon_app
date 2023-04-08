//

import 'package:epsilon_app/features/auth/login_screen/presentation/login_bloc/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  group('Login event', () {
    test('Eqality', () {
      expect(LoginClearUsernameError(), LoginClearUsernameError());
      expect(LoginClearUsernameError().props, []);
    });

    test('Eqality props', () {
      // arrange
      const tPassword = '123456';
      const event = LoginPasswordHasChanged(password: tPassword);
      // act

      // assert
      expect(event.props, [tPassword]);
    });
  });
}
