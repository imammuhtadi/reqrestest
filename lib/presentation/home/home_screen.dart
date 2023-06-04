import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netwerktest/data/models/user/user.dart';
import 'package:netwerktest/presentation/home/cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = HomeCubit();
    _bloc.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User'),),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => _bloc,
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is HomeGetUserFailedState) {
                Fluttertoast.showToast(msg: state.message);
              }
            },
            builder: (context, state) {
              if (state is HomeGetUserLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is HomeGetUserLoadedState) {
                return ListView.separated(
                  itemCount: state.response.data?.length ?? 0,
                  separatorBuilder: (context, index) {
                    return const Divider(height: 1);
                  },
                  itemBuilder: (context, index) {
                    User? user = state.response.data?[index];
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: Image.network(user?.avatar ?? '', width: 40, height: 40, fit: BoxFit.cover,),
                      ),
                      title: Text('${user?.firstName} ${user?.lastName}'),
                      subtitle: Text('${user?.email}'),
                    );
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
