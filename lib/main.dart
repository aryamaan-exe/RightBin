import 'package:flutter/material.dart';
import 'package:rightbin/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'stats.dart';
import 'camera.dart';

void main() async {
  try {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      // (user != null) ? const HomeScreen() :
      runApp(const Login());
      // runApp(const HomeScreen());
    });
  } catch (e) {
    runApp(const Login());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i = 1;
  var pages = <Widget>[
    const Stats(),
    const Camera(),
  ];
  var titles = [const Text("Your Stats"), const Text("")];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: dm,
      // appBar: AppBar(
      //   title: titles[i],
      //   backgroundColor: dm,
      //   foregroundColor: fg,
      //   centerTitle: true,
      // ),
      body: pages[i],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bg,
        selectedItemColor: fg,
        unselectedItemColor: bg_old,
        currentIndex: i,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph_rounded), label: "Stats"),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_rounded), label: "Search")
        ],
        onTap: (value) {
          setState(() {
            i = value;
          });
        },
      ),
    ));
  }
}
