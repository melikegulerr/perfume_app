import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfume_app/color.dart';
import 'package:perfume_app/perfume.dart';

class PerfumeTile extends StatelessWidget {
  myPerfume perfume;
  void Function()? onTap;
  PerfumeTile({super.key, required this.perfume, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(25),
          width: 270,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              Image.asset(
                perfume.imagePath,
                height: 240,
              ),
              //text
              Text(
                perfume.name,
                style: GoogleFonts.dmSerifDisplay(
                    fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 30),
              //price + rating
              Row(
                children: [
                  Text(
                    '\$' + perfume.price,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(width: 120),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    perfume.rating,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 90, 90, 90),
                        fontSize: 18),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
