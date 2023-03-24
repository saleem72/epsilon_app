part of 'main_controller_bloc.dart';

abstract class MainControllerEvent extends Equatable {
  const MainControllerEvent();

  @override
  List<Object> get props => [];
}

class MainControllerGoHome extends MainControllerEvent {}
