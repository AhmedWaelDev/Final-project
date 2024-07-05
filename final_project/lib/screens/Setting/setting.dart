import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/auth/delete_account/delete_account_cubit.dart';
import 'package:final_project/screens/sign_in_up/changePassword.dart';
import 'package:final_project/screens/sign_in_up/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../CustomWidgets/screensappbar.dart';
import '../../CustomWidgets/settingsContainer.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: const Color(0xffe5e9f0),
        padding: EdgeInsets.only(
            top: size.width * 20 / 320,
            right: size.width * 10 / 320,
            left: size.width * 10 / 320),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            const screensappbar(
              name: "Setting",
            ),
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 30 / 932,
                    ),
                    Text(
                      "Account",
                      style: TextStyle(
                          fontSize: size.height * 20 / 932,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 20 / 932,
                    ),
                    settingsContainer(
                      color: Colors.black,
                      icon: Icons.lock_outlined,
                      text: "Change password",
                      function: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const changePassword(),
                          ),
                        );
                      },
                    ),
                    const settingsContainer(
                      color: Colors.black,
                      icon: Icons.notifications,
                      text: "Notifications",
                    ),
                    BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
                      listener: (context, state) {
                        if (state is DeleteAccountFSuccess) {
                          CacheHelper().clearDataExceptIsVisited();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const logIn(),
                              ),
                              (route) => false);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("success"),
                            ),
                          );
                        } else if (state is DeleteAccountFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errMessage),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return state is DeleteAccountFLoading
                            ? const CircularProgressIndicator()
                            : settingsContainer(
                                function: () {
                                  context
                                      .read<DeleteAccountCubit>()
                                      .deleteAccount();
                                },
                                color: const Color(0xffC00000),
                                icon: Icons.delete,
                                text: "Delate Account",
                              );
                      },
                    ),
                    SizedBox(
                      height: size.height * 50 / 932,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
