import 'package:dartz/dartz.dart';
import 'package:epsilon_app/core/helpers/database_communicator/domain/models/company.dart';
import 'package:epsilon_app/core/helpers/database_communicator/domain/models/failures/connection_manager_failures.dart';
import 'package:epsilon_app/core/helpers/database_communicator/domain/repository/database_communicator_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failure/failure.dart';
import '../../../../core/helpers/database_communicator/domain/models/connection_params.dart';

part 'connection_configuration_event.dart';
part 'connection_configuration_state.dart';
part 'connection_configuration_bloc.freezed.dart';

class ConnectionConfigurationBloc
    extends Bloc<ConnectionConfigurationEvent, ConnectionConfigurationState> {
  final DatabaseCommunicatorRepository _repository;
  ConnectionConfigurationBloc({
    required DatabaseCommunicatorRepository repository,
  })  : _repository = repository,
        super(ConnectionConfigurationState.initial()) {
    on<_CompanyHasChanged>(_onCompanyHasChanged);
    on<_UsernameHasChanged>(_onUsernameHasChanged);
    on<_PasswordHasChanged>(_onPasswordHasChanged);
    on<_HostHasChanged>(_onHostHasChanged);
    on<_PortHasChanged>(_onPortHasChanged);
    on<_DatabaseHasChanged>(_onDatabaseHasChanged);
    on<_CheckConnection>(_onCheckConnection);
    on<_ClearFailure>(_onClearFailure);
    on<_ParamHasChanged>(_onParamHasChanged);
  }

  ConnectionParams get _params => ConnectionParams(
        host: state.host,
        port: state.port,
        database: state.database,
        username: state.username,
        password: state.password,
        company: state.company.fold(() => null, (a) => a),
      );

  _onParamHasChanged(
      _ParamHasChanged event, Emitter<ConnectionConfigurationState> emit) {
    emit(state.copyWith(
      username: event.params.username,
      password: event.params.password,
      host: event.params.host,
      port: event.params.port,
      database: event.params.database,
      company: optionOf(event.params.company),
    ));
  }

  _onCompanyHasChanged(
      _CompanyHasChanged event, Emitter<ConnectionConfigurationState> emit) {
    emit(state.copyWith(company: Some(event.company)));
  }

  _onUsernameHasChanged(
      _UsernameHasChanged event, Emitter<ConnectionConfigurationState> emit) {
    emit(state.copyWith(username: event.username));
  }

  _onPasswordHasChanged(
      _PasswordHasChanged event, Emitter<ConnectionConfigurationState> emit) {
    emit(state.copyWith(password: event.password));
  }

  _onHostHasChanged(
      _HostHasChanged event, Emitter<ConnectionConfigurationState> emit) {
    emit(state.copyWith(host: event.host));
  }

  _onPortHasChanged(
      _PortHasChanged event, Emitter<ConnectionConfigurationState> emit) {
    emit(state.copyWith(port: event.port));
  }

  _onDatabaseHasChanged(
      _DatabaseHasChanged event, Emitter<ConnectionConfigurationState> emit) {
    emit(state.copyWith(database: event.database));
  }

  _onCheckConnection(_CheckConnection event,
      Emitter<ConnectionConfigurationState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await _repository.checkConnection(_params);
    response.fold(
      (failure) {
        emit(state.copyWith(failure: Some(failure), isLoading: false));
      },
      (r) => emit(state.copyWith(connectSuccessfully: true, isLoading: false)),
    );
  }

  _onClearFailure(
      _ClearFailure event, Emitter<ConnectionConfigurationState> emit) {
    emit(state.copyWith(failure: const None()));
  }
}
