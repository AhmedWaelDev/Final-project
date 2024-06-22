import 'package:final_project/cubits/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class testScreen extends StatelessWidget {
  const testScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is getUserDataSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("user"),
            ),
          );
        } else if (state is getUserDataFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: State is getUserDataLoading
              ? const Center(child: CircularProgressIndicator())
              : state is getUserDataSuccess
                  ? ListView(
                      children: [
                        Text(
                          state.user.name,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          state.user.email,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          state.user.isDoctor,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          state.user.phone,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    )
                  : Container(),
        );
      },
    );
  }
}
