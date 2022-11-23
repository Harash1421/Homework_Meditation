import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe5fffc),
      //0xffe5fffc
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28, bottom: 27),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //Top Image
                Center(child: Image.asset("assets/vector_1.png")),
                //First Title Text
                _sizedBox(height: 7, width: 0),
                _myText("TAKE A BREATH", 22, Colors.teal, TextAlign.center,
                    isEdoFamily: true),
                //Second Title Text
                _sizedBox(height: 7, width: 0),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: _myText(
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                      11,
                      Colors.black,
                      TextAlign.center),
                ),

                //Meditation Categories
                _sizedBox(height: 10, width: 0),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _myCard("Meditation", "assets/meditation.png", 0),
                      _myCard("Yoga", "assets/yoga.png", 1),
                      _myCard("Sound", "assets/sound.png", 2),
                    ],
                  ),
                ),

                //List Of The Meditation
                _sizedBox(height: 14, width: 0),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _waysCard("The Peace", 10, "assets/peace.png"),
                          _sizedBox(height: 0, width: 18),
                          _waysCard("Stress Relief", 15, "assets/stress.png"),
                          _sizedBox(height: 0, width: 18),
                          _waysCard("The Peace", 10, "assets/peace.png"),
                          _sizedBox(height: 0, width: 18),
                          _waysCard("Stress Relief", 15, "assets/stress.png")
                        ],
                      ),
                    ),
                  ),
                ),

                //Benefits
                _sizedBox(height: 14, width: 0),
                Row(
                  children: [
                    _myText("Benefits", 18, Colors.black, TextAlign.center,
                        isWeight: true),
                  ],
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _benefitCard(
                          "Increase \n Blood Fluid", "assets/heart.png"),
                      _benefitCard("Relax\nMind", "assets/mind.png"),
                      _benefitCard("Straighten\nYour Mood", "assets/mood.png")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Method Of Text
  Widget _myText(String text, double fontSize, Color color, TextAlign textAlign,
      {isEdoFamily = false, isWeight = false}) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontFamily: isEdoFamily == true ? 'edo' : 'normal',
            fontWeight:
                isWeight == true ? FontWeight.bold : FontWeight.normal));
  }

  //Method Of Training Card
  Widget _myCard(String cName, String cImage, int index) {
    return InkWell(
      onTap: () {
        isSelectedIndex = index;
        setState(() {});
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: isSelectedIndex == index
                ? const Color(0xff1A7F72)
                : Colors.white,
            child: Center(
                child: Image.asset(
              cImage,
              height: 65,
              width: 85,
            )),
          ),
          _myText(cName, 15, Colors.black, TextAlign.center)
        ],
      ),
    );
  }

  //Method Of Way Card
  Widget _waysCard(String wName, int min, String image) {
    return Material(
      elevation: 2.4,
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      shadowColor: Colors.black,
      child: SizedBox(
        height: 180,
        width: MediaQuery.of(context).size.width / 3,
        child: Column(
          children: [
            _sizedBox(height: 14, width: 0),
            //Set Image
            Center(
              child: Container(
                  height: 65,
                  width: 64,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color(0xffb3cec9)),
                  child: Image.asset(
                    image,
                  )),
            ),
            //Set Text
            _sizedBox(height: 7, width: 0),
            _myText(wName, 14, Colors.black, TextAlign.center),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _myText(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                  8,
                  Colors.grey,
                  TextAlign.center),
            ),
            //Set Button And Minute
            Expanded(child: Container()),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 4),
              child: InkWell(
                onTap: () {
                  debugPrint("Forward");
                  setState(() {});
                },
                child: Row(
                  children: [
                    _myText("$min min", 10, Colors.black, TextAlign.left),
                    Expanded(child: Container()),
                    Image.asset("assets/next.png")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //Method Of benefits
  Widget _benefitCard(String bName, String bImage) {
    return Column(
      children: [
        Container(
          height: 95,
          width: MediaQuery.of(context).size.width / 4.5,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/union.png"))),
          child: Center(
            child: Image.asset(
              bImage,
            ),
          ),
        ),
        _sizedBox(height: 0, width: 0),
        _myText(bName, 14, Colors.black, TextAlign.center),
      ],
    );
  }

  //Method Of Sized Box
  Widget _sizedBox({required double height, required double width}) {
    return SizedBox(height: height, width: width);
  }
}
