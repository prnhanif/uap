import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class rdr1 extends StatelessWidget {
  const rdr1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
          )
        ],
      ),
      // Temukan game favorit mu
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text("RDR1",
              style: GoogleFonts.bebasNeue(fontSize: 56, color: Colors.white)),
        ),

        SizedBox(
          height: 25,
        ),

        // search bar

        SizedBox(
          height: 25,
        ),

        //horizontal list view
      ]),
    );
  }
}
