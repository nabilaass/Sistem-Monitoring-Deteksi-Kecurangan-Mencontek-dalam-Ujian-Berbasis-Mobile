// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:projek/pages/more_page.dart';

class Items {
  String title;
  String tgl;
  String durasi;
  String total;
  String img;

  Items({
    required this.title,
    required this.tgl,
    required this.durasi,
    required this.total,
    required this.img,
  });
}

class GridDashboard extends StatelessWidget {
  GridDashboard({super.key});
  Items item1 = new Items(
      title: "Maths",
      tgl: "11 Jun, 2023 12.00 PM -13.30 PM",
      durasi: "60 Minutes",
      total: "5 Questions",
      img: "assets/images/math.png");

  Items item2 = new Items(
      title: "Biology",
      tgl: "12 Jun, 2023 12.00 PM -13.30 PM",
      durasi: "60 Minutes",
      total: "5 Questions",
      img: "assets/images/bio.png");

  Items item3 = new Items(
      title: "Chemistry",
      tgl: "13 Jun, 2023 12.00 PM -13.30 PM",
      durasi: "60 Minutes",
      total: "5 Questions",
      img: "assets/images/kimia.png");

  Items item4 = new Items(
    title: "English",
    tgl: "14 Jun, 2023 12.00 PM -13.30 PM",
    durasi: "60 Minutes",
    total: "5 Questions",
    img: "assets/images/eng.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    var color = 0xff5C6BC0;
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return Container(
            decoration: BoxDecoration(
              color: Color(color),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(data.img, width: 30),
                SizedBox(height: 14),
                Text(
                  data.title,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  data.tgl,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white38,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  data.durasi,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  data.total,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
