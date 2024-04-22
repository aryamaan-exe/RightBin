import 'package:flutter/material.dart';
import 'package:rightbin/consts.dart';
import 'auth.dart';
import 'camera.dart';
import 'stats.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i = 0;
  var pages = <Widget>[const Stats(), const Camera()];
  var titles = [const Text("Your Stats"), const Text("Identify")];

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
      body: pages[i],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bg,
        selectedItemColor: fg,
        unselectedItemColor: ac,
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
