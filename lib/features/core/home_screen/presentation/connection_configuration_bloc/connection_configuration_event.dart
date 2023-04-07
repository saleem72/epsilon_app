part of 'connection_configuration_bloc.dart';

@freezed
class ConnectionConfigurationEvent with _$ConnectionConfigurationEvent {
  // const factory HomeEvent.started() = _Started;
  const factory ConnectionConfigurationEvent.companyHasChanged(
      {required Company company}) = _CompanyHasChanged;
  const factory ConnectionConfigurationEvent.usernameHasChanged(
      {required String username}) = _UsernameHasChanged;
  const factory ConnectionConfigurationEvent.passwordHasChanged(
      {required String password}) = _PasswordHasChanged;
  const factory ConnectionConfigurationEvent.hostHasChanged(
      {required String host}) = _HostHasChanged;
  const factory ConnectionConfigurationEvent.portHasChanged(
      {required String port}) = _PortHasChanged;
  const factory ConnectionConfigurationEvent.databaseHasChanged(
      {required String database}) = _DatabaseHasChanged;
  const factory ConnectionConfigurationEvent.paramHasChanged(
      {required ConnectionParams params}) = _ParamHasChanged;
  const factory ConnectionConfigurationEvent.checkConnection() =
      _CheckConnection;
  const factory ConnectionConfigurationEvent.clearFailure() = _ClearFailure;
}
