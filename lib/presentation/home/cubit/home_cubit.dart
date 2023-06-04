import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netwerktest/data/models/user/all_user_response.dart';
import 'package:netwerktest/data/repositories/user_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  final UserRepository service = UserRepository();

  getUsers() async {
    emit(HomeGetUserLoadingState());
    final res = await service.getUser(page: 2);
    if (res is AllUserResponse) {
      emit(HomeGetUserLoadedState(response: res));
    } else {
      emit(HomeGetUserFailedState(message: res.toString()));
    }
  }
}
