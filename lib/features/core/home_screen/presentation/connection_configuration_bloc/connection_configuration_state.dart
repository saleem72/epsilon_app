part of 'connection_configuration_bloc.dart';

@freezed
class ConnectionConfigurationState with _$ConnectionConfigurationState {
  const ConnectionConfigurationState._();

  const factory ConnectionConfigurationState({
    required Option<Company> company,
    required String username,
    required String password,
    required String host,
    required String port,
    required String database,
    required Option<CheckConnectionFailure> failure,
    required bool isLoading,
    required bool connectSuccessfully,
  }) = _HomeState;

  factory ConnectionConfigurationState.initial() =>
      const ConnectionConfigurationState(
        company: None(),
        username: '',
        password: '',
        host: '',
        port: '',
        database: '',
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
