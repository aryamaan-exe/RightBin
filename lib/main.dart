import 'package:flutter/material.dart';
import 'package:rightbin/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'stats.dart';
import 'camera.dart';

void main() async {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/home/': (context) => Pages(),
      '/register/': (context) => Register(),
      '/login/': (context) => Login()
    }, theme: td, home: Login());
  }
}

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int i = 1;
  @override
  Widget build(BuildContext context) {
    var pages = <Widget>[
      const Stats(),
      const Camera(),
    ];
    // var titles = [const Text("Your Stats"), const Text("")];
    return Scaffold(
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
        unselectedItemColor: dm,
        currentIndex: i,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph_rounded), label: "Stats"),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_rounded), label: "Search")
        ],
        onTap: (value) {
          setState(() {
            print(i);
            i = value;
            print(i);
          });
        },
      ),
    );
  }
}
