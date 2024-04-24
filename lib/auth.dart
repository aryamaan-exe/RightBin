import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'consts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int i = 0;
  var pages = <Widget>[const Login()];
  var titles = [const Text("Login"), const Text("Register")];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
          textSelectionTheme: TextSelectionThemeData(selectionColor: bg),
          inputDecorationTheme:
              InputDecorationTheme(floatingLabelStyle: TextStyle(color: bg))),
      home: Scaffold(
          backgroundColor: dm,
          body: SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.all(16), child: Login()),
          )),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: width / 2,
            child: TextFormField(
                style: fs, cursorColor: fg, decoration: fd('Email'))),
        SizedBox(
          width: width / 2,
          child: TextFormField(
            style: fs,
            cursorColor: fg,
            decoration: fd('Password'),
            obscureText: true,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: () {
            // do auth :O
          },
          style: ebs2,
          child: Container(
            child: Center(child: Text("LOGIN")),
          ),
        ),
      ],
    );
  }
}
