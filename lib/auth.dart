import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'firebase_options.dart';
import 'main.dart';
import 'consts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int i = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic screens = [const Register(), const Login()];
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return MaterialApp(
                routes: {
                  '/home/': (context) => const HomeScreen(),
                },
                theme: Theme.of(context).copyWith(
                  textSelectionTheme:
                      TextSelectionThemeData(selectionColor: bg),
                  inputDecorationTheme: InputDecorationTheme(
                      floatingLabelStyle: TextStyle(color: bg)),
                ),
                home: Scaffold(
                  backgroundColor: dm,
                  body: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: screens[i],
                  ),
                ),
              );
            default:
              return Placeholder();
          }
        });
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width / 2,
          child: TextFormField(
            controller: _email,
            style: fs,
            cursorColor: fg,
            decoration: fd('Email'),
          ),
        ),
        SizedBox(
          width: width / 2,
          child: TextFormField(
            controller: _password,
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
            signIn();
          },
          style: ebs2,
          child: Container(
            child: Center(child: Text("LOGIN")),
          ),
        ),
        GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: const Text(
                "Don't have an account? Register here!",
                style: TextStyle(color: Color.fromARGB(255, 6, 185, 120)),
              ),
            ))
      ],
    );
  }

  Future<void> signIn() async {
    try {
      final email = _email.text;
      final password = _password.text;
      UserCredential credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushNamedAndRemoveUntil('/home/', (route) => false);
    } catch (e) {
      print("Sign in error: $e");
    }
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width / 2,
          child: TextFormField(
            controller: _email,
            style: fs,
            cursorColor: fg,
            decoration: fd('Email'),
          ),
        ),
        SizedBox(
          width: width / 2,
          child: TextFormField(
            controller: _password,
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
            register();
          },
          style: ebs2,
          child: Container(
            child: Center(child: Text("REGISTER")),
          ),
        ),
      ],
    );
  }

  Future<void> register() async {
    try {
      final email = _email.text;
      final password = _password.text;
      UserCredential credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushNamedAndRemoveUntil('/home/', (route) => false);
    } catch (e) {
      print("Sign in error: $e");
    }
  }
}
