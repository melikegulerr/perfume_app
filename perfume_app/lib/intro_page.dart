import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfume_app/color.dart';

class IntroPage extends StatelessWidget {
  IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //name
          Padding(
            padding: const EdgeInsets.only(right: 150, top: 30),
            child: Text(
              "Sapphire",
              style: GoogleFonts.dmSerifDisplay(
                  color: Colors.deepPurple,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),

          //image
          Center(
            child: Image.asset(
              "lib/images/perfume (1).png",
              width: 250,
              height: 200,
            ),
          ),
          SizedBox(height: 10),

          //title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              textAlign: TextAlign.center,
              "FEEL PRECIOUS WITH YOUR UNIQUE SCENT",
              style: GoogleFonts.dmSerifDisplay(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          //subtitle Discover the fragrances that unveil your elegance
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              textAlign: TextAlign.start,
              "Discover the fragrances that unveil your elegance",
              style: GoogleFonts.dmSerifDisplay(
                  color: Colors.grey.shade800, fontSize: 15),
            ),
          ),
          SizedBox(height: 10),

          //button
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/homepage");
            },
            child: Container(
              width: 250,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
