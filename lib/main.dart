import 'package:diplomversec/bloc/auth_bloc/auth_bloc.dart';
import 'package:diplomversec/elements/global/auth_page.dart';
import 'package:diplomversec/repository/auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthRepository authRepository =
      AuthRepository('http://127.0.0.1:8000/auth/token/login/');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
          create: (context) => AuthBloc(authRepository), child: AuthPage()),
    );
  }
}
