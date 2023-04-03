import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/helpers/safe.dart';

part 'auth_event.dart';
part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStatus> {
  final Safe safe;
  AuthBloc({required this.safe}) : super(const AuthStatus.empty()) {
    on<AuthEvent>(
      (event, emit) {
        event.map(
          checkAuthStatus: (e) => _onCheckAuthStatus(e, emit),
          authorized: (e) => _onAuthorized(e, emit),
        );
      },
    );
  }
  _onAuthorized(_Authorized event, Emitter<AuthStatus> emit) {
    safe.setToken('Ok');
    emit(const AuthStatus.home());
  }

  _onCheckAuthStatus(_CheckAuthStatus event, Emitter<AuthStatus> emit) {
    final option = safe.getAuthStatus();
    switch (option) {
      case AuthOption.home:
        emit(const AuthStatus.home());
        break;
      case AuthOption.none:
      case AuthOption.login:
        emit(const AuthStatus.login());
        break;
    }
  }
}
