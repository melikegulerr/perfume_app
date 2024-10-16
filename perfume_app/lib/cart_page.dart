import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfume_app/color.dart';
import 'package:perfume_app/perfume.dart';
import 'package:perfume_app/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(myPerfume perfume, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(perfume);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: myBackgroundColor,
        appBar: AppBar(
          backgroundColor: myBackgroundColor,
          title: Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Text(
              "My Cart",
              style: GoogleFonts.dmSerifDisplay(fontSize: 25),
            ),
          ),
        ),
        body: Column(
          children: [
            //customer cart
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  final myPerfume perfume = value.cart[index];
                  final String name = perfume.name;
                  final String price = perfume.price;
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.purple.shade200,
                        borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: ListTile(
                        title: Text(
                          name,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '\$' + price,
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        trailing: IconButton(
                            onPressed: () => removeFromCart(perfume, context),
                            icon: Icon(Icons.delete))),
                  );
                },
              ),
            ),
            //pay button
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: 250,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.purple.shade200,
                  borderRadius: BorderRadius.circular(90),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pay now",
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
          ],
        ),
      ),
    );
  }
}
