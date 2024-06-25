import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class ParkingStatusScreen extends StatefulWidget {
  const ParkingStatusScreen({Key? key}) : super(key: key);

  @override
  State<ParkingStatusScreen> createState() => _ParkingStatusScreenState();
}

class _ParkingStatusScreenState extends State<ParkingStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
               ' FUTURE RELEASE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Expanded(
              //   child: LineChart(
              //     LineChartData(
              //         gridData: const FlGridData(show: true),
              //         borderData: FlBorderData(show: true),
              //         lineBarsData: [
              //           LineChartBarData(
              //             spots: [
              //               const FlSpot(0, 1),
              //               const FlSpot(1, 2.5),
              //               const FlSpot(2, 1.8),
              //               const FlSpot(3, 3.2),
              //               const FlSpot(4, 2),
              //               const FlSpot(5, 2.5),
              //               const FlSpot(6, 2.8),
              //             ],
              //             isCurved: true,
              //             color: Colors.blue,
              //             barWidth: 4,
              //             isStrokeCapRound: true,
              //             belowBarData: BarAreaData(show: true),
              //           ),
              //         ],
              //         titlesData: const FlTitlesData(
              //           topTitles: AxisTitles(
              //             sideTitles: SideTitles(showTitles: false),
              //           ),
              //           rightTitles: AxisTitles(
              //             sideTitles: SideTitles(showTitles: false),
              //           ),
              //           bottomTitles: AxisTitles(
              //             sideTitles: SideTitles(showTitles: true, reservedSize: 30),
              //           ),
              //           leftTitles: AxisTitles(
              //             sideTitles: SideTitles(showTitles: true, reservedSize: 30),
              //           ),
              //         )
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}



