import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'main.dart';
import 'consts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

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
    double height = MediaQuery.of(context).size.height;
    NetworkImage bgimg =
        const NetworkImage('https://images.aryamaan.xyz/Scanner.png');

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
                    '/register/': (context) => const Register(),
                  },
                  theme: Theme.of(context).copyWith(
                    textSelectionTheme:
                        const TextSelectionThemeData(selectionColor: bg),
                    inputDecorationTheme: const InputDecorationTheme(
                        floatingLabelStyle: TextStyle(color: bg)),
                  ),
                  home: Scaffold(
                    body: Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: bgimg,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: width / 2,
                                child: TextFormField(
                                  controller: _email,
                                  style: fs,
                                  cursorColor: fg,
                                  decoration: fd('Email'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: width / 2,
                                child: TextFormField(
                                  controller: _password,
                                  style: fs,
                                  cursorColor: fg,
                                  decoration: fd('Password'),
                                  obscureText: true,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                signIn();
                              },
                              style: ebs2,
                              child: Container(
                                child: const Center(child: Text("LOGIN")),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            '/register/', (route) => false);
                                  });
                                },
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                  child: Text(
                                    "Don't have an account? Register here!",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 6, 185, 120)),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ));
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(
                  color: bg,
                ),
              );
            default:
              return const Center(
                child: CircularProgressIndicator(
                  color: bg,
                ),
              );
          }
        });
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
    return MaterialApp(
        routes: {
          '/home/': (context) => const HomeScreen(),
          '/login/': (context) => const Login(),
        },
        home: Scaffold(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: SizedBox(
            //       width: width / 2,
            //       child: TextFormField(
            //         controller: _email,
            //         style: fs,
            //         cursorColor: fg,
            //         decoration: fd('Email'),
            //       )),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: width / 2,
                child: TextFormField(
                  controller: _password,
                  style: fs,
                  cursorColor: fg,
                  decoration: fd('Password'),
                  obscureText: true,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                register();
              },
              style: ebs2,
              child: Container(
                child: const Center(child: Text("REGISTER")),
              ),
            ),
          ],
        )));
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
