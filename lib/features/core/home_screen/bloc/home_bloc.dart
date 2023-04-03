import 'package:dartz/dartz.dart';
import 'package:epsilon_app/core/helpers/database_communicator/domain/models/company.dart';
import 'package:epsilon_app/core/helpers/database_communicator/domain/repository/database_communicator_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failure/failure.dart';
import '../../../../core/helpers/database_communicator/domain/models/connection_params.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DatabaseCommunicatorRepository _repository;
  HomeBloc({
    required DatabaseCommunicatorRepository repository,
  })  : _repository = repository,
        super(HomeState.initial()) {
    on<_CompanyHasChanged>(_onCompanyHasChanged);
    on<_UsernameHasChanged>(_onUsernameHasChanged);
    on<_PasswordHasChanged>(_onPasswordHasChanged);
    on<_HostHasChanged>(_onHostHasChanged);
    on<_PortHasChanged>(_onPortHasChanged);
    on<_DatabaseHasChanged>(_onDatabaseHasChanged);
    on<_CheckConnection>(_onCheckConnection);
    on<_FetchCachedConnection>(_onFetchCachedConnection);
    on<_ClearFailure>(_onClearFailure);
  }

  ConnectionParams get _params => ConnectionParams(
        host: state.host,
        port: state.port,
        database: state.database,
        username: state.username,
        password: state.password,
        company: state.company.fold(() => null, (a) => a),
      );

  _onCompanyHasChanged(_CompanyHasChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(company: Some(event.company), forceUpdate: false));
  }

  _onUsernameHasChanged(_UsernameHasChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(username: event.username, forceUpdate: false));
  }

  _onPasswordHasChanged(_PasswordHasChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(password: event.password, forceUpdate: false));
  }

  _onHostHasChanged(_HostHasChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(host: event.host, forceUpdate: false));
  }

  _onPortHasChanged(_PortHasChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(port: event.port, forceUpdate: false));
  }

  _onDatabaseHasChanged(_DatabaseHasChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(database: event.database, forceUpdate: false));
  }

  _onCheckConnection(_CheckConnection event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true, forceUpdate: false));
    final response = await _repository.checkConnection(_params);
    response.fold(
      (failure) {
        emit(state.copyWith(failure: Some(failure), isLoading: false));
      },
      (r) => emit(state.copyWith(connectSuccessfully: true, isLoading: false)),
    );
  }

  _onFetchCachedConnection(
      _FetchCachedConnection event, Emitter<HomeState> emit) async {
    final connectionsResponse = await _repository.fetchCachedConnections();
    connectionsResponse.fold(
      (failure) {},
      (connections) {
        if (connections.isNotEmpty) {
          final lastInUse = connections.first;
          emit(state.copyWith(
            forceUpdate: true,
            host: lastInUse.host,
            port: lastInUse.port,
            database: lastInUse.database,
            username: lastInUse.username,
            password: lastInUse.password,
            company: optionOf(lastInUse.company),
          ));
        }
      },
    );
  }

  _onClearFailure(_ClearFailure event, Emitter<HomeState> emit) {
    emit(state.copyWith(failure: const None()));
  }
}
