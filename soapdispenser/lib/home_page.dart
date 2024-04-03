import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DatabaseReference _databaseReference;
  int _humanCount = 0;
  int _soapCount = 0;
  String _soapLevel = 'SUFFICIENT';

  @override
@override
void initState() {
  super.initState();
  // Initialize Firebase database reference
  _databaseReference = FirebaseDatabase.instance.reference().child('Example');
  
  // Listen for changes in 'humanCount' field
  _databaseReference.child('humanCount').onValue.listen((event) {
    setState(() {
      // Update _humanCount with the new value from Firebase
      _humanCount = (event.snapshot.value as int?) ?? 0;
    });
  });

  // Listen for changes in 'soapCount' field
  _databaseReference.child('soapCount').onValue.listen((event) {
    setState(() {
      // Update _soapCount with the new value from Firebase
      _soapCount = (event.snapshot.value as int?) ?? 0;
    });
  });

  // Listen for changes in 'soapLevel' field
  _databaseReference.child('soapLevel').onValue.listen((event) {
    setState(() {
      // Update _soapLevel with the new value from Firebase
      _soapLevel = event.snapshot.value as String ?? 'SUFFICIENT';
    });
  });
}

  @override
  Widget build(BuildContext context) {
    Color buttonColor = _soapLevel == 'SUFFICIENT' ? const Color(0xFF3FD460) : const Color(0xFFD43F3F);

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
          height: 80,
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Card(
            color: buttonColor,
            child: Center(
              child: Text(
                _soapLevel == 'SUFFICIENT' ? 'Good to go!' : 'Refill needed!',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
  // bottomNavigationBar: BottomNavigationBar(
  //   items: const <BottomNavigationBarItem>[
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.home),
  //       label: 'Home',
  //     ),
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.pie_chart),
  //       label: 'Analytics',
  //     ),
  //   ],
  //   onTap: (index) {
  //     setState(() {
  //       // Update the state of your app
  //       // For example, navigate to the different pages
  //     });
  //   },
  // ),
);
  }
}
