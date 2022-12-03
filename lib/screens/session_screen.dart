import 'package:flutter/material.dart';
import 'package:meditation/screens/grid_containter.dart';

import '../model/item.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});
  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

List<Item> myList = [
  Item(
      Name: "Product 1",
      Price: 2.25,
      Image: "assets/foods/fajita_chicken_burger.png",
      Type: "White Friday Offer"),
  Item(
      Name: "Product 2",
      Price: 1.5,
      Image: "assets/foods/classic_beef_burger.png",
      Type: "White Friday Offer"),
  Item(
      Name: "Product 3",
      Price: 2.75,
      Image: "assets/foods/double_beef_burger.png",
      Type: "10% Offer"),
  Item(
      Name: "Product 4",
      Price: 4.25,
      Image: "assets/foods/italian_beef_burger.png",
      Type: "Check our latest offer"),
  Item(
      Name: "Product 5",
      Price: 2.5,
      Image: "assets/foods/fajita_chicken_burger.png",
      Type: "White Friday Offer"),
  Item(
      Name: "Product 6",
      Price: 3.50,
      Image: "assets/foods/san_franciscos_chicken_burger.png",
      Type: "10% Offer"),
  Item(
      Name: "Product 7",
      Price: 3.25,
      Image: "assets/foods/avocado_chicken__burger.png",
      Type: "White Friday Offer"),
  Item(
      Name: "Product 8",
      Price: 0.75,
      Image: "assets/foods/caesar_salad.png",
      Type: "White Friday Offer"),
  Item(
      Name: "Product 9",
      Price: 1.0,
      Image: "assets/foods/chicken_fajita_salad.png",
      Type: "Check our latest offer"),
  Item(
      Name: "Product 10",
      Price: 1.25,
      Image: "assets/foods/julienne_salad.png",
      Type: "10% Offer")
];

List<String> categories = [
  "All Product",
  "White Friday Offer",
  "10% Offer",
  "Check our latest offer"
];

class _SessionScreenState extends State<SessionScreen> {
  String selectedCategory = "All Product";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          bottom: false,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                _text("Find Items", 45, Colors.black, isBold: true),
                _sizedBox(height: 14, width: 0),
                SizedBox(height: 58, child: _buttonsListType()),
                Expanded(
                    child: GridContainer(
                  selectedCategory: selectedCategory,
                )),
              ],
            ),
          )),
    );
  }

  //Method For Text
  Widget _text(String text, double textSize, Color color, {isBold = false}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: textSize,
          color: color,
          fontWeight: isBold = isBold ? FontWeight.bold : FontWeight.normal),
    );
  }

  //Method For Button Of Type
  Widget _buttonsListType() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(7.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.black),
                onPressed: () {
                  selectedCategory = categories[index];
                  setState(() {});
                },
                child: _text(categories[index], 20, Colors.white)),
          );
        }));
  }

  //Method For Grid Grid Items
  // Widget _gridView(String selectedCategory) {
  //   return
  // }

  //Method Of Sized Box
  Widget _sizedBox({required double height, required double width}) {
    return SizedBox(height: height, width: width);
  }
}
