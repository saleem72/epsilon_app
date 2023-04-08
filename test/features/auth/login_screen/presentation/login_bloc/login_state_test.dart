//

import 'package:epsilon_app/core/usecases/validation_status.dart';
import 'package:epsilon_app/features/auth/login_screen/presentation/login_bloc/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  group('Login State', () {
    test('Eqality', () {
      expect(const LoginState(), const LoginState());
      expect(const LoginState().props, [false, null, null, false, null, false]);
    });

    test('Copy with', () {
      // arrange
      const state = LoginState();
      final state2 = state.copyWith(isLoading: true);
      // act

      // assert
      expect(state2.isLoading, true);
    });

    test('Clear username error', () {
      // arrange
      const state = LoginState();
      final state2 =
          state.copyWith(usernameStatus: ValidationStatus.emptyUsername);
      final state3 = state2.clearUsernameError();
      // act

      // assert
      expect(state3.usernameStatus, null);
    });

    test('Clear password error', () {
      // arrange
      const state = LoginState();
      final state2 =
          state.copyWith(passwordStatus: ValidationStatus.emptyPassword);
      final state3 = state2.clearPasswordError();
      // act

      // assert
      expect(state3.passwordStatus, null);
    });
  });
}
