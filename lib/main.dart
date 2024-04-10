import 'package:flutter/material.dart';
import 'package:rightbin/consts.dart';

TextStyle head = TextStyle(fontSize: 24);
void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Your Stats"),
        backgroundColor: bg,
        foregroundColor: fg,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  height: 500,
                ),
                Text("Recent Disposals", style: head),
                Container(
                  color: Colors.blue,
                  height: 500,
                ),
              ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bg,
        selectedItemColor: fg,
        unselectedItemColor: ac,
        currentIndex: i,
        items: [
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
