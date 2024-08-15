import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'consts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:convert';

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
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bar_chart_rounded,
                        color: bg,
                        size: 64,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Stats",
                          style: sch,
                        ),
                      )
                    ]),
                Container(child: const Graph()),
                const Text("Recent Disposals", style: head),
                SizedBox(
                    height: 500,
                    child: ListView(children: const [Tile(), Tile()]))
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

  dynamic makereq() async {
    var url =
        Uri.parse('https://http-forwarder-aarav-dayals-projects.vercel.app/');

    var body = json.encode({"route": "/stats"});
    final response = await http.post(url, body: body);
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    makereq();
    List<num> data = [1, 4, 1, 5, 2];
    num width = MediaQuery.of(context).size.width;
    for (int j = 0; j < data.length; j++) {
      bardata.add(BarChartGroupData(x: j + 1, barRods: [
        BarChartRodData(
            toY: data[j].toDouble(),
            color: btn,
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
                    String text = value.toString();
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
            gridData: const FlGridData(show: false),
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
    return const Column(
      children: [
        ListTile(
            leading: Icon(
              Icons.calendar_month_rounded,
              color: bg,
            ),
            title: Text(
              "27/04/24: 5",
              style: fs,
            )),
        Divider(),
      ],
    );
  }
}
