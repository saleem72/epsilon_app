//

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:epsilon_app/core/usecases/validation_status.dart';
import 'package:epsilon_app/features/auth/login_screen/data/repository/login_repository_impl.dart';
import 'package:epsilon_app/features/auth/login_screen/presentation/login_bloc/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dependancies/mock_login_repository/login_repository_test.mocks.dart';
import '../../dependancies/validators/validators_test.mocks.dart';

// // Mock Cubit
// class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

// Mock Bloc
class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  late LoginBloc loginBloc;
  late MockValidateUsername validateUsername;
  late MockValidatePassword validatePassword;
  late MockLoginRepositoryImpl repository;
  setUp(() {
    repository = MockLoginRepositoryImpl();
    validateUsername = MockValidateUsername();
    validatePassword = MockValidatePassword();
    loginBloc = LoginBloc(
      repository: repository,
      usernameValidator: validateUsername,
      passwordValidator: validatePassword,
    );
  });

  group('LoginBloc', () {
    test('initial state', () {
      expect(loginBloc.state, const LoginState());
    });

    blocTest<LoginBloc, LoginState>(
      'should emit [invalid form] when Username has changed',
      build: () {
        // when(repository.login(username: any, password: any))
        //     .thenAnswer((realInvocation) async => const Right('it is ok'));
        when(validateUsername.call(any))
            .thenAnswer((realInvocation) => ValidationStatus.valid);
        when(validatePassword.call(any))
            .thenAnswer((realInvocation) => ValidationStatus.emptyPassword);
        return loginBloc;
      },
      act: (bloc) => bloc.add(const LoginUsernameHasChanged(username: 'abc')),
      expect: () => const [LoginState()],
    );

    blocTest<LoginBloc, LoginState>(
      'should emit [valid form] when Username has changed',
      // setUp: when(validateUsername.call(any)).thenReturn(ValidationStatus.valid),
      build: () {
        // when(repository.login(username: any, password: any))
        //     .thenAnswer((realInvocation) async => const Right('it is ok'));
        when(validateUsername.call(any))
            .thenAnswer((realInvocation) => ValidationStatus.valid);
        when(validatePassword.call(any))
            .thenAnswer((realInvocation) => ValidationStatus.emptyPassword);
        return loginBloc;
      },
      act: (bloc) => bloc.add(const LoginUsernameHasChanged(username: 'abc')),
      verify: (bloc) => verify(validateUsername.call('abc')),
      expect: () => const [LoginState()],
    );
  });
}
