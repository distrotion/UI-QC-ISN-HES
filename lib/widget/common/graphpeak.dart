import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RoughnessGraph extends StatefulWidget {
  RoughnessGraph({
    super.key,
    this.data,
    this.widgetdata,
  });

  List<FlSpot>? data;
  Widget? widgetdata;

  @override
  State<RoughnessGraph> createState() => _RoughnessGraphState();
}

class _RoughnessGraphState extends State<RoughnessGraph> {
  @override
  Widget build(BuildContext context) {
    // final List<FlSpot> data = _generateRoughnessData();
    List<FlSpot> data = widget.data ?? [];
    final List<FlSpot> peaks = findPeaksOverThreshold(data, 0.25);

    print('Total Peaks Over 0.25: ${peaks.length}');

    return Column(
      children: [
        Text(
          'Peaks over 0.25 µm: ${peaks.length}',
          style: TextStyle(fontSize: 24),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: 350,
            width: 1000,
            child: Stack(
              children: [
                if (data.length > 0) ...[
                  LineChart(
                    LineChartData(
                      minX: 0,
                      maxX: data[data.length - 1].x,
                      minY: -1.0,
                      maxY: 1.0,
                      gridData: FlGridData(show: true),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles:
                              SideTitles(showTitles: true, reservedSize: 40),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: true),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          isCurved: false,
                          color: Colors.black,
                          barWidth: 1,
                          dotData: FlDotData(show: false),
                          spots: [
                            FlSpot(0.00, 0.00),
                            FlSpot(data[data.length - 1].x, 0.00)
                          ],
                        ),
                        LineChartBarData(
                          isCurved: false,
                          color: Colors.black,
                          barWidth: 1,
                          dotData: FlDotData(show: false),
                          spots: [
                            FlSpot(0.00, 0.25),
                            FlSpot(data[data.length - 1].x, 0.25)
                          ],
                        ),
                        LineChartBarData(
                          isCurved: false,
                          color: Colors.black,
                          barWidth: 1,
                          dotData: FlDotData(show: false),
                          spots: [
                            FlSpot(0.00, -0.25),
                            FlSpot(data[data.length - 1].x, -0.25)
                          ],
                        ),
                        LineChartBarData(
                          isCurved: false,
                          color: Colors.red,
                          barWidth: 1,
                          spots: data,
                          dotData: FlDotData(
                            show: true,
                            checkToShowDot: (spot, _) => peaks
                                .any((p) => p.x == spot.x && p.y == spot.y),
                            // dotColor: Colors.blue,
                            // dotSize: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ตำแหน่งข้อความ Peak 1, 2, ...
                  ...peaks.asMap().entries.map((entry) {
                    final index = entry.key;
                    final spot = entry.value;
                    return Positioned(
                      left: 40 +
                          (spot.x * 3.6), // แปลงตำแหน่ง x ไปที่ width: 1000
                      top: spot.y > 0 ? 100 : 250, // แปลง y ไปที่ height: 350
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    );
                  }).toList(),
                ],
              ],
            ),
          ),
        ),
        widget.widgetdata ?? Container(),
      ],
    );
  }

  /// ข้อมูลตัวอย่าง roughness
  List<FlSpot> _generateRoughnessData() {
    return [
      FlSpot(0.00, 0.0),
      FlSpot(0.01, 0.3), // peak 1
      FlSpot(0.02, -0.1),
      FlSpot(0.03, 0.1), // peak 2
      FlSpot(0.04, -0.1),
      FlSpot(0.05, 0.5), // peak 3
      FlSpot(0.06, 0.1),
      FlSpot(0.07, 0.26), // peak 4
      FlSpot(0.08, 0.1),
      FlSpot(0.09, -0.2),
      FlSpot(0.10, 0.3),
      FlSpot(0.15, -0.3),
      FlSpot(0.20, 0.4), // peak 5
      FlSpot(0.30, 0.0),
    ];
  }
}

/// หายอดคลื่นที่มากกว่า threshold
List<FlSpot> findPeaksOverThreshold(List<FlSpot> data, double threshold) {
  List<FlSpot> peaks = [];
  String memeP = '';
  String memeN = '';
  int coutP = 0;
  int coutN = 0;
  for (int i = 1; i < data.length - 1; i++) {
    // if (data[i].y >= threshold &&
    //     data[i].y >= data[i - 1].y &&
    //     data[i].y >= data[i + 1].y) {
    //   peaks.add(data[i]);
    // } else if (data[i].y <= -threshold &&
    //     data[i].y <= data[i - 1].y &&
    //     data[i].y <= data[i + 1].y) {
    //   peaks.add(data[i]);
    // }
    if (data[i].y >= threshold) {
      if (memeP == '') {
        memeP = 'alresdy';
        coutP++;
        peaks.add(data[i]);
      }
    } else {
      memeP = '';
    }
    if (data[i].y <= -threshold) {
      if (memeN == '') {
        memeN = 'alresdy';
        coutN++;
        peaks.add(data[i]);
      }
    } else {
      memeN = '';
    }
  }
  print(coutP + coutN);
  return peaks;
}
