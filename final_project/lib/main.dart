import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/Appointment/create_appointment/create_appointment_cubit.dart';
import 'package:final_project/cubits/Appointment/up_coming/up_coming_cubit.dart';
import 'package:final_project/cubits/auth/Logout/cubit/logout_cubit.dart';
import 'package:final_project/cubits/auth/change_password/change_password_cubit.dart';
import 'package:final_project/cubits/auth/forget_password/forget_password_cubit.dart';
import 'package:final_project/cubits/auth/login/login_cubit.dart';
import 'package:final_project/cubits/auth/register/register_cubit.dart';
import 'package:final_project/cubits/doctor/add_schedule/add_schedule_cubit.dart';
import 'package:final_project/cubits/doctor/get_all_pateint_for_doctor/get_all_pateint_for_doctor_cubit.dart';
import 'package:final_project/cubits/doctor/get_patient_with_date/get_patient_with_date_cubit.dart';
import 'package:final_project/cubits/doctor/online%20doctors/cubit/online_doctors_cubit.dart';
import 'package:final_project/cubits/online%20doctor/cubit/online_doc_cubit.dart';
import 'package:final_project/cubits/paitent/get_all_doctors_for_spciality/get_doctors_for_spciality_cubit.dart';
import 'package:final_project/cubits/payment/cubit/payment_cubit.dart';
import 'package:final_project/cubits/profile/cubit/photo_cubit.dart';
import 'package:final_project/cubits/update_information/update_information_cubit.dart';
import 'package:final_project/firebase_options.dart';
import 'package:final_project/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const Color primeColor = Color(0xFF50B7C5);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          create: (context) => OnlineDocCubit(),
        ),
        BlocProvider(
          create: (context) => OnlineDoctorsCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => CreateAppointmentCubit(),
        ),
        BlocProvider(
          create: (context) => GetDoctorsForSpcialityCubit(),
        ),
        BlocProvider(
          create: (context) => ForgetPasswordCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateInformationCubit(),
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
          create: (context) => LogoutCubit(),
        ),
        BlocProvider(
          create: (context) => ChangePasswordCubit(),
        ),
        BlocProvider(
          create: (context) => GetAllPateintForDoctorCubit(),
        ),
        BlocProvider(
          create: (context) => PhotoCubit(),
        ),
        BlocProvider(
          create: (context) => GetPatientWithDateCubit(),
        ),
        BlocProvider(
          create: (context) => GetPatientWithDateCubit(),
        ),
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
