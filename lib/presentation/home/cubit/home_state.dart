part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeGetUserLoadingState extends HomeState {}

class HomeGetUserLoadedState extends HomeState {
  final AllUserResponse response;

  const HomeGetUserLoadedState({required this.response});
}

class HomeGetUserFailedState extends HomeState {
  final String message;

  const HomeGetUserFailedState({required this.message});
}
