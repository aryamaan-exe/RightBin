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
      home: Scaffold(
          appBar: AppBar(
            title: titles[i],
            backgroundColor: bg,
            foregroundColor: fg,
            centerTitle: true,
          ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: fs,
          cursorColor: fg,
          decoration: fd,
        )
      ],
    );
  }
}
