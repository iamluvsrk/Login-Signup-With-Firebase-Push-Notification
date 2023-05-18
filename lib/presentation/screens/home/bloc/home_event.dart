part of 'home_bloc.dart';

/// Event being processed by [HomeEvent]
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

/// Notify bloc to logout the user
class Logout extends HomeEvent {}
