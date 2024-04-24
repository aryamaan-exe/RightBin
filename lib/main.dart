import 'package:flutter/material.dart';
import 'package:rightbin/consts.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth.dart';
import 'camera.dart';
import 'stats.dart';

void main() async {
  try {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      // (user != null) ? const HomeScreen() :
      runApp(const AuthScreen());
    });
  } catch (e) {
    runApp(const AuthScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i = 1;
  var pages = <Widget>[const Stats(), const Camera()];
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
