import 'package:flutter/material.dart';
import 'package:meditation/screens/session_screen.dart';

class GridContainer extends StatefulWidget {
  const GridContainer({required this.selectedCategory, super.key});

  final String selectedCategory;

  @override
  State<GridContainer> createState() => _GridContainerState();
}

class _GridContainerState extends State<GridContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              mainAxisExtent: 250),
          itemCount: myList
              .where(widget.selectedCategory != "All Product"
                  ? (element) => widget.selectedCategory == element.Type
                  : (element) => widget.selectedCategory == "All Product")
              .length,
          itemBuilder: ((context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey,
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  //Product Names
                  _text(myList[index].Name, 17, Colors.black),
                  //Products Image
                  _sizedBox(height: 4, width: 0),
                  Image.asset(
                    myList[index].Image,
                    height: 100,
                    width: 100,
                  ),

                  //Products Price
                  _sizedBox(height: 7, width: 0),
                  _text("Price: ${myList[index].Price}JD", 17, Colors.black),

                  //Button For Add To Cart
                  Expanded(child: Container()),
                  TextButton(
                      onPressed: () {
                        myList[index].qty += 1;
                        setState(() {});
                      },
                      child: _text(
                          myList[index].qty == 0
                              ? "Add To Cart"
                              : "${myList[index].qty} Added to cart",
                          18,
                          Colors.black)),
                ]),
              ),
            );
          }),
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

  //Method Of Sized Box
  Widget _sizedBox({required double height, required double width}) {
    return SizedBox(height: height, width: width);
  }
}
