import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/helpers/database_communicator/domain/models/connection_params.dart';
import '../../domain/repository/i_connection_configuration_repository.dart';

part 'connection_configuration_monitor_bloc.freezed.dart';
part 'connection_configuration_monitor_event.dart';
part 'connection_configuration_monitor_state.dart';

class ConnectionConfigurationMonitorBloc extends Bloc<
    ConnectionConfigurationMonitorEvent, ConnectionConfigurationMonitorState> {
  final IConnectionConfigurationRepository _repository;
  ConnectionConfigurationMonitorBloc({
    required IConnectionConfigurationRepository repository,
  })  : _repository = repository,
        super(const _Initial()) {
    on<_FetchCachedConnection>(_onFetchCachedConnection);
  }

  _onFetchCachedConnection(_FetchCachedConnection event,
      Emitter<ConnectionConfigurationMonitorState> emit) async {
    final connectionsResponse = await _repository.fetchCachedConnections();
    connectionsResponse.fold(
      (failure) {},
      (connection) {
        emit(ConnectionConfigurationMonitorState.newParams(params: connection));
      },
    );
  }
}
