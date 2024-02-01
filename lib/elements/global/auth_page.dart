import 'package:diplomversec/bloc/auth_bloc/auth_bloc.dart';
import 'package:diplomversec/screens/screen_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController _loginController1 = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticatedState) {
          print(state.token);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ScreenChoice()));
        }
      },
      child: Scaffold(
          backgroundColor: Colors.grey[400],
          body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            if (state is AuthLoadingState) {
              return CircularProgressIndicator();
            } else if (state is AuthErrorState) {
              return Text(
                'Error: ${state.errorMessage}',
                style: TextStyle(color: Colors.red),
              );
            }
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.orange[200]!,
                    Colors.orange[400]!,
                    Colors.orange[600]!
                  ],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: authPage(context),
                ),
              ),
            );
          })),
    );
  }

  Center authPage(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9 > 250 ? 500 : null,
        height: 600,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(35)),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Icon(Icons.delivery_dining_rounded, size: 200),
            const SizedBox(
              height: 45,
            ),
            loginField1(context),
            const SizedBox(
              height: 10,
            ),
            loginField2(context),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Забыли логин или пароль?',
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF2962FF),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w500),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            signUpButton(context),
          ],
        ),
      ),
    );
  }

  Container signUpButton(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blueAccent,
            Colors.blueAccent[400]!,
            Colors.blueAccent[700]!,
          ],
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: () {
          authBloc.add(AuthLoginEvent(
              username: _loginController1.text,
              password: _passwordController2.text));
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(350, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: const Text(
          'Вход',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              fontFamily: 'Comfortaa'),
        ),
      ),
    );
  }

  ConstrainedBox loginField1(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 350, maxHeight: 55),
      child: TextFormField(
        controller: _loginController1,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(27),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black54, width: 1),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: const OutlineInputBorder(),
            hintText: 'Логин',
            hintStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                fontFamily: 'Comfortaa',
                color: Colors.black)),
      ),
    );
  }

  ConstrainedBox loginField2(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 350, maxHeight: 55),
      child: TextFormField(
        controller: _passwordController2,
        obscureText: true,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(27),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black54, width: 1),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: const OutlineInputBorder(),
            hintText: 'Пароль',
            hintStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                fontFamily: 'Comfortaa',
                color: Colors.black)),
      ),
    );
  }
}
