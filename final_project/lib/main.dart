import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/Appointment/cubit/up_coming_cubit.dart';
import 'package:final_project/cubits/auth/login/login_cubit.dart';
import 'package:final_project/cubits/auth/register/register_cubit.dart';
import 'package:final_project/cubits/doctor/cubit/add_schedule_cubit.dart';
import 'package:final_project/cubits/online%20doctor/cubit/online_doc_cubit.dart';
import 'package:final_project/cubits/payment/cubit/payment_cubit.dart';
import 'package:final_project/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const Color primeColor = Color(0xFF50B7C5);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => AddScheduleCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => PaymentCubit(),
        ),
        BlocProvider(
          create: (context) => UpComingCubit(),
        ),
        BlocProvider(
          create: (context) => OnlineDocCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EClinck',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF50B7C5)),
          useMaterial3: true,
        ),
        home: const splash(),
      ),
    );
  }
}
