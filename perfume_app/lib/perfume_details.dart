import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:perfume_app/color.dart';
import 'package:perfume_app/home_page.dart';
import 'package:perfume_app/perfume.dart';
import 'package:perfume_app/shop.dart';
import 'package:provider/provider.dart';

class PerfumeDetails extends StatefulWidget {
  final myPerfume perfume;
  const PerfumeDetails({super.key, required this.perfume});

  @override
  State<PerfumeDetails> createState() => _PerfumeDetailsState();
}

class _PerfumeDetailsState extends State<PerfumeDetails> {
  int quantityCount = 0;

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();
      shop.addToCart(widget.perfume, quantityCount);
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.purple.shade300,
        content: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            "Successfully added cart",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.done,
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                Center(
                  child: Image.asset(
                    widget.perfume.imagePath,
                    height: 90,
                  ),
                ),

                SizedBox(height: 10),
                //icon rating
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      //icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 35,
                      ),

                      SizedBox(width: 2),
                      //rating
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          widget.perfume.rating,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5),
                //name

                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    widget.perfume.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                //description
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    widget.perfume.description,
                    style: GoogleFonts.dmSerifDisplay(),
                  ),
                ),
                SizedBox(height: 40),

                //price + button
                Container(
                    width: double.infinity,
                    color: Colors.purple.shade100,
                    child: Column(
                      children: [
                        //price + quantity
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //price
                              Text(
                                '\$' + widget.perfume.price,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),

                              //quantity
                              Row(
                                children: [
                                  //minus button
                                  Container(
                                    decoration: BoxDecoration(
                                      color: myBackgroundColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                        onPressed: decrementQuantity,
                                        icon: Icon(Icons.remove)),
                                  ),
                                  //quantity count
                                  SizedBox(
                                    width: 30,
                                    child: Center(
                                      child: Text(
                                        quantityCount.toString(),
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  //plus button
                                  Container(
                                    decoration: BoxDecoration(
                                      color: myBackgroundColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                        onPressed: incrementQuantity,
                                        icon: Icon(Icons.add)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        //button
                        GestureDetector(
                          onTap: addToCart,
                          child: Container(
                            width: 250,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.purple.shade300,
                              borderRadius: BorderRadius.circular(90),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Add to card",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
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
                      ],
                    ))
              ],
            ),
          )),
        ],
      ),
    );
  }
}
