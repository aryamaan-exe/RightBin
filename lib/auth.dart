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
              return Scaffold(
                body: Stack(children: [
                  Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: bgimg,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
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
                              padding: EdgeInsets.all(32),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: bg,
                                    fontSize: 48,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: width / 1.5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: _email,
                                    style: TextStyle(color: bg),
                                    cursorColor: bg,
                                    decoration: fd('Email'),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: width / 1.5,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: _password,
                                  style: TextStyle(color: bg),
                                  cursorColor: bg,
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
                              style: ButtonStyle(
                                  maximumSize: MaterialStatePropertyAll<Size>(
                                      Size(width / 1.5, 48)),
                                  backgroundColor:
                                      const MaterialStatePropertyAll<Color>(bg),
                                  foregroundColor:
                                      const MaterialStatePropertyAll<Color>(fg),
                                  shape: r),
                              child: Container(
                                child: const Center(
                                    child: Text(
                                  "Log In",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                )),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Navigator.of(context)
                                        .pushReplacementNamed('/register/');
                                  });
                                },
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                  child: Text(
                                    "Don't have an account? Register here!",
                                    style: TextStyle(color: bg),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              );
            case ConnectionState.waiting:
              return Scaffold(
                body: Stack(children: [
                  Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: bgimg,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
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
                              padding: EdgeInsets.all(32),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: bg,
                                    fontSize: 48,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: width / 1.5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: _email,
                                    style: TextStyle(color: bg),
                                    cursorColor: bg,
                                    decoration: fd('Email'),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: width / 1.5,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: _password,
                                  style: TextStyle(color: bg),
                                  cursorColor: bg,
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
                              style: ButtonStyle(
                                  maximumSize: MaterialStatePropertyAll<Size>(
                                      Size(width / 1.5, 48)),
                                  backgroundColor:
                                      const MaterialStatePropertyAll<Color>(bg),
                                  foregroundColor:
                                      const MaterialStatePropertyAll<Color>(fg),
                                  shape: r),
                              child: Container(
                                child: const Center(
                                    child: Text(
                                  "Log In",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                )),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Navigator.of(context)
                                        .pushReplacementNamed('/register/');
                                  });
                                },
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                  child: Text(
                                    "Don't have an account? Register here!",
                                    style: TextStyle(color: bg),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              );
            default:
              return Scaffold(
                body: Stack(children: [
                  Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: bgimg,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
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
                              padding: EdgeInsets.all(32),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: bg,
                                    fontSize: 48,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: width / 1.5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: _email,
                                    style: TextStyle(color: bg),
                                    cursorColor: bg,
                                    decoration: fd('Email'),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: width / 1.5,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: _password,
                                  style: TextStyle(color: bg),
                                  cursorColor: bg,
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
                              style: ButtonStyle(
                                  maximumSize: MaterialStatePropertyAll<Size>(
                                      Size(width / 1.5, 48)),
                                  backgroundColor:
                                      const MaterialStatePropertyAll<Color>(bg),
                                  foregroundColor:
                                      const MaterialStatePropertyAll<Color>(fg),
                                  shape: r),
                              child: Container(
                                child: const Center(
                                    child: Text(
                                  "Log In",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                )),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Navigator.of(context)
                                        .pushReplacementNamed('/register/');
                                  });
                                },
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                  child: Text(
                                    "Don't have an account? Register here!",
                                    style: TextStyle(color: bg),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
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
      Navigator.of(context).pushReplacementNamed('/home/');
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
              return Scaffold(
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
                          padding: EdgeInsets.all(32),
                          child: Text(
                            "Create an Account",
                            style: TextStyle(
                                color: bg,
                                fontSize: 40,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: width / 1.5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: _email,
                                style: TextStyle(color: bg),
                                cursorColor: bg,
                                decoration: fd('Email'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: width / 1.5,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              controller: _password,
                              style: TextStyle(color: bg),
                              cursorColor: bg,
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
                          style: ButtonStyle(
                              maximumSize: MaterialStatePropertyAll<Size>(
                                  Size(width / 1.5, 48)),
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(bg),
                              foregroundColor:
                                  const MaterialStatePropertyAll<Color>(fg),
                              shape: r),
                          child: Container(
                            child: const Center(
                                child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            )),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.of(context)
                                    .pushReplacementNamed('/login/');
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                              child: Text(
                                "Already have an account? Log in here!",
                                style: TextStyle(color: bg),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              );
            case ConnectionState.waiting:
              return Scaffold(
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
                          padding: EdgeInsets.all(32),
                          child: Text(
                            "Create an Account",
                            style: TextStyle(
                                color: bg,
                                fontSize: 40,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: width / 1.5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: _email,
                                style: TextStyle(color: bg),
                                cursorColor: bg,
                                decoration: fd('Email'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: width / 1.5,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              controller: _password,
                              style: TextStyle(color: bg),
                              cursorColor: bg,
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
                          style: ButtonStyle(
                              maximumSize: MaterialStatePropertyAll<Size>(
                                  Size(width / 1.5, 48)),
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(bg),
                              foregroundColor:
                                  const MaterialStatePropertyAll<Color>(fg),
                              shape: r),
                          child: Container(
                            child: const Center(
                                child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            )),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.of(context)
                                    .pushReplacementNamed('/login/');
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                              child: Text(
                                "Already have an account? Log in here!",
                                style: TextStyle(color: bg),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              );
            default:
              return Scaffold(
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
                          padding: EdgeInsets.all(32),
                          child: Text(
                            "Create an Account",
                            style: TextStyle(
                                color: bg,
                                fontSize: 40,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: width / 1.5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: _email,
                                style: TextStyle(color: bg),
                                cursorColor: bg,
                                decoration: fd('Email'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: width / 1.5,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              controller: _password,
                              style: TextStyle(color: bg),
                              cursorColor: bg,
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
                          style: ButtonStyle(
                              maximumSize: MaterialStatePropertyAll<Size>(
                                  Size(width / 1.5, 48)),
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(bg),
                              foregroundColor:
                                  const MaterialStatePropertyAll<Color>(fg),
                              shape: r),
                          child: Container(
                            child: const Center(
                                child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            )),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.of(context)
                                    .pushReplacementNamed('/login/');
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                              child: Text(
                                "Already have an account? Log in here!",
                                style: TextStyle(color: bg),
                              ),
                            ))
                      ],
                    ),
                  ),
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
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushReplacementNamed('/home/');
    } catch (e) {
      print("Sign in error: $e");
    }
  }
}
