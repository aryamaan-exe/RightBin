import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Your Stats"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
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
    ));
  }
}
