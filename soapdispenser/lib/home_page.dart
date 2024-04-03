import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
late DatabaseReference _humanCountRef;
late DatabaseReference _soapCountRef;
int _humanCount = 0;
int _soapCount = 0;

@override
void initState() {
  super.initState();
  
  // Reference for 'humanCount'
  _humanCountRef = FirebaseDatabase.instance.reference().child('humanCount');
  
  // Reference for 'soapCount'
  _soapCountRef = FirebaseDatabase.instance.reference().child('soapCount');

  // Listener for 'humanCount'
  _humanCountRef.onValue.listen((event) {
    setState(() {
      if (event.snapshot.value != null) {
        _humanCount = event.snapshot.value as int;
      }
    });
  });

  // Listener for 'soapCount'
  _soapCountRef.onValue.listen((event) {
    setState(() {
      if (event.snapshot.value != null) {
        _soapCount = event.snapshot.value as int;
      }
    });
  });
}


  @override
  Widget build(BuildContext context) {
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
            // PERSON COUNT CARD
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
                                Text(
                                  _humanCount.toString(),
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
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

          

                        //SOAP COUNT CARD
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
                               Text(
                                  _humanCount.toString(),
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
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

            //REFILL MESSAGE CARD
            Container(
              height: 80,
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),	
              child: Card(
                color: Color.fromARGB(255, 5, 241, 52),
                child: Center(
                  child: Text(
                    'Good to go!',
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
    );
  }
}
