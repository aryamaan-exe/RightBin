import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'consts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Create an Account"),
          backgroundColor: bg,
          foregroundColor: fg,
          centerTitle: true,
        ),
      ),
    );
  }
}
