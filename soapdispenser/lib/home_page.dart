import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: Column(children: [

          //PERSON COUNT CARD
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
                                  '65',
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
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Text(
                                  '65',
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


          //REFILL MESSAGE CARD
          Container(
            height: 80, 
            margin: EdgeInsets.only(left: 10, right: 10, top: 20), 
            child: Card(
                color: Color(0xFFD43F3F),
              child: Center(
                child: Text(
                  'Refilling Required',
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