import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfume_app/color.dart';
import 'package:perfume_app/main.dart';
import 'package:perfume_app/perfume.dart';
import 'package:perfume_app/perfume_details.dart';
import 'package:perfume_app/perfume_tile.dart';
import 'package:perfume_app/shop.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigateToPerfumeDetails(int index) {
    final shop = context.read<Shop>();
    final Perfumes = shop.Perfumes;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PerfumeDetails(
          perfume: shop.Perfumes[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final Perfumes = shop.Perfumes;
    return Scaffold(
      backgroundColor: myBackgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.grey.shade800,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cartpage");
              },
              icon: Icon(Icons.shopping_cart))
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text(
            "Sapphire",
            style: GoogleFonts.dmSerifDisplay(color: Colors.black),
          ),
        ),
        backgroundColor: myBackgroundColor,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: myBackgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                width: double.infinity,
                height: 150,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      "lib/images/perfume2.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/homepage");
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: const Color.fromARGB(255, 179, 105, 160),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Home page",
                      style: TextStyle(
                        color: Color.fromARGB(
                          255,
                          179,
                          105,
                          160,
                        ),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 270),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/intropage");
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: const Color.fromARGB(255, 179, 105, 160),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Logout",
                      style: TextStyle(
                        color: Color.fromARGB(
                          255,
                          179,
                          105,
                          160,
                        ),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          //search bar
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Search here...",
                  labelStyle: TextStyle(color: Colors.grey.shade600),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),

          // perfume
          Expanded(
              child: ListView.builder(
            itemCount: shop.Perfumes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return PerfumeTile(
                perfume: shop.Perfumes[index],
                onTap: () {
                  navigateToPerfumeDetails(index);
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
