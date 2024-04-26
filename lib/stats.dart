import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'consts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// final db = FirebaseFirestore.instance;
// final now = DateTime.now();
// final date =
//     '${now.day as String}/${now.month as String}/${now.year as String}';
// final entry = <String, int>{date: 5};

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    // db.collection("users").doc("a").set(entry).then((value) {
    //   print("UwU");
    // });
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(child: Graph()),
                Text("Recent Disposals", style: head),
                SizedBox(
                    height: 500, child: ListView(children: [Tile(), Tile()]))
              ])),
    );
  }
}

class Graph extends StatefulWidget {
  const Graph({super.key});

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  List<BarChartGroupData> bardata = [];
  List<int> data = [1, 2, 1, 4, 5];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    for (int j = 0; j < data.length; j++) {
      bardata.add(BarChartGroupData(x: j + 1, barRods: [
        BarChartRodData(
            toY: data[j] as double,
            color: fg,
            width: 18,
            borderRadius: BorderRadius.circular(5)),
      ]));
    }
    return SizedBox(
        width: width - 32,
        height: 500,
        child: BarChart(BarChartData(
            titlesData: FlTitlesData(
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                  interval: 1,
                  reservedSize: 28,
                  getTitlesWidget: (value, meta) {
                    String text = value as String;
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 0,
                      child: Text(text,
                          style: const TextStyle(
                            color: fg,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          )),
                    );
                  },
                ))),
            gridData: FlGridData(show: false),
            maxY: data.reduce(max) + 5,
            barGroups: bardata)));
  }
}

class Tile extends StatefulWidget {
  const Tile({super.key});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            leading: Icon(
              Icons.calendar_month_rounded,
              color: fg,
            ),
            title: Text(
              "Hello",
              style: fs,
            )),
        Divider(),
      ],
    );
  }
}
