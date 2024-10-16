import 'package:flutter/material.dart';
import 'package:ngopskuy/models/coffee.dart';

class CoffeeShop extends ChangeNotifier {
  // coffee for sale list
  final List<Coffee> _shop = [
    Coffee(
        name: 'Expresso',
        price: '10',
        imagePath: 'lib/images/expresso.png'
    ),
    Coffee(
        name: 'Iced Latte',
        price: '15' ,
        imagePath: 'lib/images/iced-latte.png'
    ),
    Coffee(
        name: "Latte Art",
        price: "20",
        imagePath: "lib/images/latte-art.png"
    ),
    Coffee(
        name: "Bubble Tea",
        price: "25",
        imagePath: "lib/images/bubble-tea.png"
    ),
    Coffee(
        name: "Matcha Tea",
        price: "25",
        imagePath: "lib/images/matcha-tea.png"
    ),
    Coffee(
        name: "Tea",
        price: "10",
        imagePath: "lib/images/tea.png"
    ),
  ];

  // user cart
  List<Coffee> _userCart = [];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add item to cart
  void addItemToCart(Coffee item) {
    _userCart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Coffee item) {
    _userCart.remove(item);
    notifyListeners();
  }
}
