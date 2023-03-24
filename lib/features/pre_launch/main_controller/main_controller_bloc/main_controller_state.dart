part of 'main_controller_bloc.dart';

enum MainControllerStatus { login, home }

abstract class MainControllerState extends Equatable {
  const MainControllerState();

  @override
  List<Object> get props => [];
}

class MainControllerInitial extends MainControllerState {}
