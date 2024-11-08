import 'package:flutter/material.dart';
import 'package:ngopskuy/components/coffee_tile.dart';
import 'package:ngopskuy/models/coffee.dart';
import 'package:ngopskuy/models/coffee_shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add coffee to cart
  void addToCart(Coffee coffee) {
    // add to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    // let user know it add beem successfully added
    showDialog(context: context, builder: (context) => AlertDialog(title: Text("Successfully added to cart")));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    const Text(
                      "How would you like your coffee?",
                      style: TextStyle(fontSize: 20),
                    ),

                    const SizedBox(height: 25),

                    // list of coffee to buy
                    Expanded(
                        child: ListView.builder(
                            itemCount: value.coffeeShop.length,
                            itemBuilder: (context, index) {
                              // get individual coffee
                              Coffee eachCoffee = value.coffeeShop[index];

                              // return the tile for this coffee
                              return CoffeeTile(
                                coffee: eachCoffee,
                                onPressed: () => addToCart(eachCoffee),
                                icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                              );
                            }))
                  ],
                ))));
  }
}
