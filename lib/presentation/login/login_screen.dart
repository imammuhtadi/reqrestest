// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netwerktest/common/widget/button.dart';
import 'package:netwerktest/common/widget/edittext.dart';
import 'package:netwerktest/common/widget/label.dart';
import 'package:netwerktest/presentation/home/home_screen.dart';
import 'package:netwerktest/presentation/login/cubit/login_cubit.dart';
import 'package:netwerktest/theme/app_font.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginCubit _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = LoginCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Test')),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => _bloc,
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoadedState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              } else if (state is LoginFailedState) {
                Fluttertoast.showToast(msg: state.message);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40.0),
                        child: Text('Log In.', style: textExtraLargeBold),
                      ),
                      Label(text: 'Email'),
                      SizedBox(height: 8),
                      Edittext(
                        controller: _bloc.emailController,
                        hint: 'Masukkan email',
                        inputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16),
                      Label(text: 'Password'),
                      SizedBox(height: 8),
                      Edittext(
                        controller: _bloc.passwordController,
                        hint: 'Masukkan password',
                        obscureText: true,
                      ),
                      SizedBox(height: 16),
                      Button(
                        isLoading: state is LoginLoadingState,
                        onPressed: () {
                          _bloc.login();
                        },
                        label: 'Log In',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
