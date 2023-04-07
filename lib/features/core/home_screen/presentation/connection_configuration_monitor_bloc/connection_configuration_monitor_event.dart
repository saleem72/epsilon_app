part of 'connection_configuration_monitor_bloc.dart';

@freezed
class ConnectionConfigurationMonitorEvent
    with _$ConnectionConfigurationMonitorEvent {
  const factory ConnectionConfigurationMonitorEvent.fetchCachedConnection() =
      _FetchCachedConnection;
}
