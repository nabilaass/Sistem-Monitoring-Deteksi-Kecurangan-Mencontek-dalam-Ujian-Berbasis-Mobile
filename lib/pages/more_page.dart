import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:projek/pages/gridDashboard.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 110),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "HELLO! WELCOME BACK.",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Color(0xff5C6BC0),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Mata Pelajaran",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Color(0xff5C6BC0),
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  alignment: Alignment.topCenter,
                  icon:
                      Image.asset("assets/images/notification.png", width: 24),
                )
              ],
            ),
          ),
          SizedBox(height: 50),
          //TODO Grid Dashboard
          GridDashboard()
        ],
      ),
    );
  }
}
