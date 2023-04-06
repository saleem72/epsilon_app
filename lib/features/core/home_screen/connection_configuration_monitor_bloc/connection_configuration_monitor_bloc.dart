import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/helpers/database_communicator/domain/models/connection_params.dart';
import '../../../../core/helpers/database_communicator/domain/repository/database_communicator_repository.dart';

part 'connection_configuration_monitor_event.dart';
part 'connection_configuration_monitor_state.dart';
part 'connection_configuration_monitor_bloc.freezed.dart';

class ConnectionConfigurationMonitorBloc extends Bloc<
    ConnectionConfigurationMonitorEvent, ConnectionConfigurationMonitorState> {
  final DatabaseCommunicatorRepository _repository;
  ConnectionConfigurationMonitorBloc({
    required DatabaseCommunicatorRepository repository,
  })  : _repository = repository,
        super(const _Initial()) {
    on<_FetchCachedConnection>(_onFetchCachedConnection);
  }

  _onFetchCachedConnection(_FetchCachedConnection event,
      Emitter<ConnectionConfigurationMonitorState> emit) async {
    final connectionsResponse = await _repository.fetchCachedConnections();
    connectionsResponse.fold(
      (failure) {},
      (connections) {
        if (connections.isNotEmpty) {
          final lastInUse = connections.first;
          emit(
              ConnectionConfigurationMonitorState.newParams(params: lastInUse));
        }
      },
    );
  }
}
