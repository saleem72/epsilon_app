part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  // const factory HomeEvent.started() = _Started;
  const factory HomeEvent.companyHasChanged({required Company company}) =
      _CompanyHasChanged;
  const factory HomeEvent.usernameHasChanged({required String username}) =
      _UsernameHasChanged;
  const factory HomeEvent.passwordHasChanged({required String password}) =
      _PasswordHasChanged;
  const factory HomeEvent.hostHasChanged({required String host}) =
      _HostHasChanged;
  const factory HomeEvent.portHasChanged({required String port}) =
      _PortHasChanged;
  const factory HomeEvent.databaseHasChanged({required String database}) =
      _DatabaseHasChanged;
  const factory HomeEvent.checkConnection() = _CheckConnection;
  const factory HomeEvent.fetchCachedConnection() = _FetchCachedConnection;
  const factory HomeEvent.clearFailure() = _ClearFailure;
}
