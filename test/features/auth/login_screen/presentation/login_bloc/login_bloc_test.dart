//

import 'package:bloc_test/bloc_test.dart';
import 'package:epsilon_app/core/usecases/validate_password.dart';
import 'package:epsilon_app/core/usecases/validate_username.dart';
import 'package:epsilon_app/core/usecases/validation_status.dart';
import 'package:epsilon_app/features/auth/login_screen/presentation/login_bloc/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dependancies/mock_login_repository/login_repository_test.mocks.dart';
import '../../dependancies/validators/validators_test.mocks.dart';

void main() {
  late LoginBloc mockLoginBloc;
  late LoginBloc realLoginBlock;
  late MockValidateUsername validateUsername;
  late MockValidatePassword validatePassword;
  late MockLoginRepositoryImpl repository;
  setUp(() {
    repository = MockLoginRepositoryImpl();
    validateUsername = MockValidateUsername();
    validatePassword = MockValidatePassword();
    mockLoginBloc = LoginBloc(
      repository: repository,
      usernameValidator: validateUsername,
      passwordValidator: validatePassword,
    );

    realLoginBlock = LoginBloc(
      repository: repository,
      usernameValidator: ValidateUsername(),
      passwordValidator: ValidatePassword(),
    );
  });

  group('LoginBloc:', () {
    test('initial state should be empty when bloc first craeted', () {
      expect(mockLoginBloc.state, const LoginState());
    });

    group('username,', () {
      blocTest<LoginBloc, LoginState>(
        'should validate username when username changes',
        build: () {
          when(validateUsername.call(any))
              .thenAnswer((realInvocation) => ValidationStatus.shortUsername);
          when(validatePassword.call(any))
              .thenAnswer((realInvocation) => ValidationStatus.emptyPassword);
          return mockLoginBloc;
        },
        act: (bloc) {
          bloc.add(const LoginUsernameHasChanged(username: 'abc'));
          // bloc.add(LoginUsernameLostFocus());
        },
        verify: (bloc) => verify(validateUsername.call('abc')),
        expect: () => const [LoginState()],
      );

      blocTest<LoginBloc, LoginState>(
        'should emit [empty usename] when Username  changed to empty value',
        build: () {
          return realLoginBlock;
        },
        act: (bloc) {
          bloc.add(const LoginUsernameHasChanged(username: ''));
          bloc.add(LoginUsernameLostFocus());
        },
        skip: 1,
        expect: () => [
          const TypeMatcher<LoginState>().having((p0) => p0.usernameStatus,
              'usernameStatus', ValidationStatus.emptyUsername)
        ],
      );

      blocTest<LoginBloc, LoginState>(
        'should emit [short usename] when Username  changed to short value',
        build: () {
          return realLoginBlock;
        },
        act: (bloc) {
          bloc.add(const LoginUsernameHasChanged(username: 'abc'));
          bloc.add(LoginUsernameLostFocus());
        },
        skip: 1,
        expect: () => [
          const TypeMatcher<LoginState>().having((p0) => p0.usernameStatus,
              'usernameStatus', ValidationStatus.shortUsername)
        ],
      );
    });

    group('password,', () {
      blocTest<LoginBloc, LoginState>(
        'should validate password when password changes',
        build: () {
          when(validateUsername.call(any))
              .thenAnswer((realInvocation) => ValidationStatus.shortUsername);
          when(validatePassword.call(any))
              .thenAnswer((realInvocation) => ValidationStatus.emptyPassword);
          return mockLoginBloc;
        },
        act: (bloc) {
          bloc.add(const LoginPasswordHasChanged(password: 'abc'));
          // bloc.add(LoginUsernameLostFocus());
        },
        verify: (bloc) => verify(validatePassword.call('abc')),
      );

      blocTest<LoginBloc, LoginState>(
        'should emit [empty password] when password  changed to empty value',
        build: () {
          return realLoginBlock;
        },
        act: (bloc) {
          bloc.add(const LoginPasswordHasChanged(password: ''));
          bloc.add(LoginPasswordLostFocus());
        },
        skip: 1,
        expect: () => [
          const TypeMatcher<LoginState>().having((p0) => p0.passwordStatus,
              'passwordStatus', ValidationStatus.emptyPassword)
        ],
      );

      blocTest<LoginBloc, LoginState>(
        'should emit [short password] when password  changed to short value',
        build: () {
          return realLoginBlock;
        },
        act: (bloc) {
          bloc.add(const LoginPasswordHasChanged(password: 'abc'));
          bloc.add(LoginPasswordLostFocus());
        },
        skip: 1,
        expect: () => [
          const TypeMatcher<LoginState>().having((p0) => p0.passwordStatus,
              'passwordStatus', ValidationStatus.shortPassword)
        ],
      );
    });
  });
}
