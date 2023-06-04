import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:netwerktest/data/models/auth/login_response.dart';
import 'package:netwerktest/data/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  final AuthRepository service = AuthRepository();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    emit(LoginLoadingState());
    final res = await service.login(
      email: emailController.text,
      password: passwordController.text,
    );
    if (res is LoginResponse) {
      emit(LoginLoadedState());
    } else {
      emit(LoginFailedState(message: res.toString()));
    }
  }
}
