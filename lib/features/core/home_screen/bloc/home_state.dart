part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    required Option<Company> company,
    required String username,
    required String password,
    required String host,
    required String port,
    required String database,
    required bool forceUpdate,
    required Option<Failure> failure,
    required bool isLoading,
    required bool connectSuccessfully,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        company: None(),
        username: '',
        password: '',
        host: '',
        port: '',
        database: '',
        forceUpdate: false,
        failure: None(),
        isLoading: false,
        connectSuccessfully: false,
      );

  bool isValid() {
    return company.isSome() &&
        username.isNotEmpty &&
        password.isNotEmpty &&
        host.isNotEmpty &&
        port.isNotEmpty &&
        database.isNotEmpty;
  }
}
