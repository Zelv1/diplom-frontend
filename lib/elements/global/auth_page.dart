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
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ErrorBanner(context);
                _passwordController.clear();
              });
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

  Future<dynamic> ErrorBanner(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text(
              'Произошла ошибка',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w500,
              ),
            ),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(32)),
              child: const Text(
                'Неправильный логин или пароль',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w500),
              ),
            ));
      },
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
              username: _loginController.text,
              password: _passwordController.text));
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
        controller: _loginController,
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
        controller: _passwordController,
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
