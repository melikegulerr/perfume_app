import 'package:flutter/material.dart';

import 'perfume.dart';

class Shop extends ChangeNotifier {
  final List<myPerfume> _Perfumes = [
    myPerfume(
      name: "VERSACE\nBright Crystal",
      price: "79",
      imagePath: "lib/images/versace.jpg",
      rating: "4.3",
      description:
          "An inviting, flower-fresh perfume.It provides a rare beauty by being characterized by a floral, fresh and vibrating scent. This unique scent, presented in a bright, crystal, timelessly elegant bottle, reveals freshness and floral notes. Heart Note: Peony, Magnolia, Lotus. Base Note: Herbal Amber, Acaju, Musk",
    ),
    myPerfume(
      name: "TOM FORD\nVanilla Sex",
      price: "390",
      imagePath: "lib/images/tom ford vanilla sex.jpg",
      rating: "4.9",
      description:
          "Prized as perfumery's most iconic fragrance ingredient, vanilla embodies seductive power in its purest form.As the original splendor of vanilla emerges and soft flowers elevate to pure, flawless charm.Fragrance Notes: India Vanilla Tincture, Vanilla Absol, Sandalwood Essence",
    ),
    myPerfume(
        name: "GIORGIO ARMANI\nMy Way",
        price: "200",
        imagePath: "lib/images/myway.jpg",
        rating: "4.2",
        description:
            "My Way is an invitation to expand your horizons and live new experiences around the world. A bouquet of dazzling white flowers is kept in a talismanic bottle created as a metaphor for the world.Top Notes: Bergamot, Orange Flower; Heart notes: Tuberose, Jasmine; Base Notes: Cedar Wood, White Musk, Vanilla"),
    myPerfume(
        name: "YSL\nLibre",
        price: "190",
        imagePath: "lib/images/ysl libre.jpg",
        rating: "4.8",
        description:
            "Yves Saint Laurent's new women's perfume, the freedom to experience everything without limits.The perfume of strong and free women who live their freedom beyond measure.Floral;Top Notes: Tangerine Oil Cereal Oil French Lavender Oil Currant Heart Notes: Lavender Oil Lily Jasmine Orange Blossom."),
  ];
  //customer cart
  List<myPerfume> _cart = [];
  List<myPerfume> get cart => _cart;
  //getter methods
  List<myPerfume> get Perfumes => _Perfumes;
  //add to cart
  void addToCart(myPerfume perfumeItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(perfumeItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(myPerfume perfume) {
    _cart.remove(perfume);
    notifyListeners();
  }
}
