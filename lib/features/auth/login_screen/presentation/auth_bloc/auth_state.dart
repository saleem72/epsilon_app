part of 'auth_bloc.dart';

@freezed
class AuthStatus with _$AuthStatus {
  const factory AuthStatus.empty() = _Empty;
  const factory AuthStatus.home() = _Home;
  const factory AuthStatus.login() = _Login;
}
