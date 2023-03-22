// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final ValidationStatus? usernameStatus;
  final ValidationStatus? passwordStatus;
  final bool isValid;
  final Failure? failure;
  final bool loginSuccessfully;

  const LoginState({
    this.isLoading = false,
    this.usernameStatus,
    this.passwordStatus,
    this.isValid = false,
    this.failure,
    this.loginSuccessfully = false,
  });

  @override
  List<Object?> get props => [
        isLoading,
        usernameStatus,
        passwordStatus,
        isValid,
        failure,
        loginSuccessfully,
      ];

  LoginState copyWith({
    bool? isLoading,
    ValidationStatus? usernameStatus,
    ValidationStatus? passwordStatus,
    bool? isValid,
    Failure? failure,
    bool? loginSuccessfully,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isValid: isValid ?? this.isValid,
      usernameStatus: usernameStatus ?? this.usernameStatus,
      passwordStatus: passwordStatus ?? this.passwordStatus,
      failure: failure ?? this.failure,
      loginSuccessfully: loginSuccessfully ?? this.loginSuccessfully,
    );
  }

  LoginState clearFailure() {
    return LoginState(
      isLoading: isLoading,
      isValid: isValid,
      usernameStatus: usernameStatus,
      passwordStatus: passwordStatus,
      failure: null,
      loginSuccessfully: loginSuccessfully,
    );
  }

  LoginState clearUsernameError() {
    return LoginState(
      isLoading: isLoading,
      isValid: isValid,
      usernameStatus: null,
      passwordStatus: passwordStatus,
      failure: failure,
      loginSuccessfully: loginSuccessfully,
    );
  }

  LoginState clearPasswordError() {
    return LoginState(
      isLoading: isLoading,
      isValid: isValid,
      usernameStatus: usernameStatus,
      passwordStatus: null,
      failure: failure,
      loginSuccessfully: loginSuccessfully,
    );
  }
}
