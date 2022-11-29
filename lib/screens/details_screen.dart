import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
      {super.key,
      required this.title,
      required this.photo,
      required this.followers,
      required this.following});
  final String title;
  final String photo;
  final int followers;
  final int following;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9eee4),
      body: SafeArea(
        bottom: false,
        child: Stack(alignment: Alignment.topCenter, children: [
          Column(
            children: [
              _sizedBox(height: 125, width: 0),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50))),
                ),
              ),
            ],
          ),

          //Foreground Column
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //Back Button
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new)),
                  ],
                ),
                //User Photo
                _sizedBox(height: 20, width: 0),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: const Color(0xffb3cec9)),
                  height: 150,
                  width: 150,
                  child: Image.asset(widget.photo),
                ),

                //Name
                _sizedBox(height: 15, width: 0),
                _myText(widget.title, 20, Colors.black, TextAlign.center,
                    isWeight: true),

                //Username
                _sizedBox(height: 4, width: 0),
                _myText("@Mediation_A", 12, Colors.grey, TextAlign.center),

                //Followers And Following
                _sizedBox(height: 10, width: 0),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 85, right: 85),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          //Following
                          _myText("${widget.following}", 20, Colors.black,
                              TextAlign.center),
                          _sizedBox(height: 10, width: 0),
                          _myText(
                              "Following", 12, Colors.grey, TextAlign.center),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: 80,
                        width: 1,
                        color: Colors.grey,
                      ),
                      Expanded(child: Container()),
                      Column(
                        children: [
                          //Followers
                          _myText("${widget.followers}", 20, Colors.black,
                              TextAlign.center),
                          _sizedBox(height: 10, width: 0),
                          _myText(
                              "Followers", 12, Colors.grey, TextAlign.center),
                        ],
                      ),
                    ],
                  ),
                ),

                //Biography
                Padding(
                  padding: const EdgeInsets.all(17),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _myText(
                              "Biography", 20, Colors.black, TextAlign.start,
                              isWeight: true),
                        ],
                      ),
                      _sizedBox(height: 7, width: 0),
                      _myText(
                          "Hello everybody, I am Christine from New York. I am an UX Designer that work for a company called Under Armour. I am usually using Figma to do my work. Joining Clubhouse to meet more incredible people across the world.",
                          12,
                          Colors.grey,
                          TextAlign.start),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _myText(String text, double fontSize, Color color, TextAlign textAlign,
      {isWeight = false}) {
    return Text(text,
        textAlign: textAlign,
        maxLines: 5,
        style: TextStyle(
            fontSize: fontSize,
            color: color,
            height: 1.4,
            fontWeight:
                isWeight == true ? FontWeight.w700 : FontWeight.normal));
  }

  //Method Of Sized Box
  Widget _sizedBox({required double height, required double width}) {
    return SizedBox(height: height, width: width);
  }
}
