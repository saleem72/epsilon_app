import 'package:bloc/bloc.dart';
import '../../../../core/helpers/safe.dart';
import 'package:equatable/equatable.dart';

part 'main_controller_event.dart';
part 'main_controller_state.dart';

class MainControllerBloc
    extends Bloc<MainControllerEvent, MainControllerStatus> {
  final Safe safe;
  MainControllerBloc({required this.safe}) : super(safe.getAuthStatus()) {
    on<MainControllerGoHome>(_onGoHome);
  }
  _onGoHome(MainControllerGoHome event, Emitter<MainControllerStatus> emit) {
    safe.setToken('Ok');
    emit(MainControllerStatus.home);
  }
}
