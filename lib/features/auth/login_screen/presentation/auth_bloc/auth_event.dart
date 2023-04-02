part of 'auth_bloc.dart';

// abstract class AuthEvent extends Equatable {
//   const AuthEvent();

//   @override
//   List<Object> get props => [];
// }

// class MainControllerGoHome extends AuthEvent {}

// class MainControllerCheckAuthStatus extends AuthEvent {}

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthStatus() = AuthEventCheckAuthStatus;
  const factory AuthEvent.authorized() = AuthEventAuthorized;
}
