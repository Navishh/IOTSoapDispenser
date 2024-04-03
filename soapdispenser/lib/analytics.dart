import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:soapdispenser/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

// Importing home_page.dart to access the fetched data

class AnalyticsPage extends StatelessWidget {
  final List<int> humanCountData;
  final List<int> soapCountData;

  AnalyticsPage({required this.humanCountData, required this.soapCountData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Analytics',
          style: GoogleFonts
              .poppins( fontWeight: FontWeight.w500  ), // Set the fontFamily to GoogleFonts.poppins
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:10, bottom:30, left: 20, right: 20 ),
            child: Text(
              'Average Soap Count per Hour',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF237CBC)),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 100,
                  minY: 0,
                  maxY: 100, 
                  lineBarsData: [
                    LineChartBarData(
                      spots: _generateSpots(soapCountData),
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:30, bottom:30, left: 20, right: 20  ),
            child: Text(
              'Average Human Count per Hour',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF237CBC)),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 100,
                  minY: 0,
                  maxY: 100,
                  lineBarsData: [
                    LineChartBarData(
                      spots: _generateSpots(humanCountData),
                      isCurved: true,
                      color: Colors.red,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ),
           Container(
            margin: EdgeInsets.only(top: 20),
            child: BottomNavigationBar(
              showSelectedLabels: false, // Add this
              showUnselectedLabels: false, // Add this
              elevation: 0.0, // Add this
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.grey), // Changed color to grey (ash)
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.pie_chart, color: Colors.purple), // Changed color to purple
                  label: '',
                ),
              ],
              onTap: (index) {
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnalyticsPage(
                          humanCountData: humanCountData, 
                          soapCountData: soapCountData,  
                        ),
                      ),
                    );
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  List<FlSpot> _generateSpots(List<int> data) {
    List<FlSpot> spots = [];
    for (int i = 0; i < data.length; i++) {
      spots.add(FlSpot(i.toDouble(), data[i].toDouble()));
    }
    return spots;
  }
}
