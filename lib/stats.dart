import 'package:flutter/material.dart';
import 'consts.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: fg,
                height: 500,
              ),
              Text("Recent Disposals", style: head),
              Container(
                color: fg,
                height: 500,
              ),
            ]),
      ),
    );
  }
}
