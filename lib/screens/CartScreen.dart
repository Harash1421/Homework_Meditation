import 'package:flutter/material.dart';
import 'package:meditation/screens/session_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(children: [
            _text("Cart Products", 45, Colors.black, isBold: true),
            _sizedBox(14, 0),
            Expanded(child: _gridView())
          ]),
        ),
      ),
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

  //Method For Grid View
  Widget _gridView() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 200,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12),
          primary: false,
          itemCount: myList.length,
          shrinkWrap: false,
          itemBuilder: ((context, index) {
            if (myList[index].qty == 0) {
              return Container(
                color: Colors.white,
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //Product Names
                      _text(myList[index].Name, 17, Colors.black),
                      //Products Image
                      _sizedBox(4, 0),
                      Image.asset(
                        myList[index].Image,
                        height: 100,
                        width: 100,
                      ),

                      Expanded(child: Container()),

                      //Quantity Number
                      _text("Quantity = ${myList[index].qty}", 18, Colors.black)
                    ],
                  ),
                ),
              );
            }
          })),
    );
  }

  //Method For Sized Box
  Widget _sizedBox(double height, double width) {
    return SizedBox(height: height, width: width);
  }
}
