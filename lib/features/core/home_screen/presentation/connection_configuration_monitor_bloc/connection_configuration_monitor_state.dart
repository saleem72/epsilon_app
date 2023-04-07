part of 'connection_configuration_monitor_bloc.dart';

@freezed
class ConnectionConfigurationMonitorState
    with _$ConnectionConfigurationMonitorState {
  const factory ConnectionConfigurationMonitorState.initial() = _Initial;
  const factory ConnectionConfigurationMonitorState.newParams(
      {required ConnectionParams params}) = _NewParams;
}
