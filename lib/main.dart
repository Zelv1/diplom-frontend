import 'package:diplomversec/bloc/auth_bloc/auth_bloc.dart';
import 'package:diplomversec/bloc/verification_bloc/verification_bloc.dart';
import 'package:diplomversec/elements/global/auth_page.dart';
import 'package:diplomversec/repository/auth_repository/auth_repository.dart';
import 'package:diplomversec/repository/verification_repository/verification_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  AuthRepository authRepository = AuthRepository();
  //VerificationRepository verificationRepository = VerificationRepository();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
              create: (BuildContext context) => AuthBloc(authRepository)),
          // BlocProvider(
          //     create: (BuildContext context) =>
          //         VerificationBloc(verificationRepository))
        ],
        child: AuthPage(),
      ),
    );
  }
}
