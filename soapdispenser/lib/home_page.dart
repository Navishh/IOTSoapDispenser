import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soapdispenser/analytics.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DatabaseReference _databaseReference;
  int _humanCount = 0;
  int _soapCount = 0;
  List<int> humanCountData = [];
  List<int> soapCountData = [];
  String _soapLevel = 'SUFFICIENT';

  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance.ref().child('Example');

    // Listen for changes in 'humanCount' field
    _databaseReference.child('humanCount').onValue.listen((event) {
      setState(() {
        _humanCount = (event.snapshot.value ?? 0) as int;
        humanCountData.add(_humanCount);
      });
    });

    // Listen for changes in 'soapCount' field
    _databaseReference.child('soapCount').onValue.listen((event) {
      setState(() {
        _soapCount = (event.snapshot.value ?? 0) as int;
        soapCountData.add(_soapCount);
      });
    });

    // Listen for changes in 'soapLevel' field
    _databaseReference.child('soapLevel').onValue.listen((event) {
      setState(() {
        _soapLevel = (event.snapshot.value ?? 'SUFFICIENT') as String;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Color buttonColor =
        _soapLevel == 'SUFFICIENT' ? Color(0xFF3FD460) : Color(0xFFD43F3F);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DASHBOARD',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 26, 26, 26),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Human Count Card
            Container(
              height: 200,
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Card(
                color: Color(0xFF237CBC),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(40),
                        child: Icon(
                          Icons.person,
                          size: 57,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 80, top: 45),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'COUNT',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '$_humanCount',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Soap Count Card
            Container(
              height: 200,
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Card(
                color: Color(0xFF3FD4C3),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(40),
                        child: Icon(
                          Icons.water_drop_sharp,
                          size: 57,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 80, top: 45),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'COUNT',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '$_soapCount',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Refill Message Card
            Container(
              height: 110,
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Card(
                color: buttonColor,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Icon(
                          Icons.battery_3_bar_rounded,
                          size: 57,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        _soapLevel == 'SUFFICIENT'
                            ? 'Good to go!'
                            : 'Refill Required!',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),




          Container(
            margin: EdgeInsets.only(top: 75), 
            child: BottomNavigationBar(
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.purple),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.pie_chart),
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
      ),
    );
  }
}
