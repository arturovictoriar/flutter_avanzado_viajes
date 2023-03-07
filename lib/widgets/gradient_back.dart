import 'package:flutter/material.dart';

class GradientBack extends StatefulWidget {


  final String title;
  final double? heigth;
  const GradientBack({super.key, required this.title, this.heigth});

  @override
  State<StatefulWidget> createState() {
    return _GradientBack();
  }
}

class _GradientBack extends State<GradientBack> {
  @override
  Widget build(BuildContext context) {

    double screenHeigth = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double? heigth = widget.heigth;
    double gradientHeight = 0.0;
    // String gradientTitle = widget.title;

    if (heigth != null) {
      gradientHeight = heigth.toDouble();
    } else {
      gradientHeight = screenHeigth;
    }

    return Container(
      width: screenWidth,
      height: gradientHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF4268D3),
              Color(0xFF584CD1)
            ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
            stops: [0.0, 0.6],
            tileMode: TileMode.clamp
        )
      ),
      // alignment: const Alignment(-0.9, -0.6),
      child: ClipRect(
        child: Align(
          alignment: const Alignment(-1.5, -0.8),
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: FittedBox(
            fit: BoxFit.none,
            alignment: const Alignment(-1.5, -0.8),
            child: Container(
              width: screenHeigth,
              height: screenHeigth,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 0.05),
                borderRadius: BorderRadius.circular(screenHeigth / 2),
              ),
            ),
          ),
        )
      )
      
      /*
      Text(
        gradientTitle,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold
        ),
      */
    );
  }

}