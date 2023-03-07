import 'package:flutter/material.dart';
import '../../../widgets/button_purple.dart';

class DescriptionPlace extends StatelessWidget {

  final String namePlace;
  final int stars;
  final String descriptionPlace;

  const DescriptionPlace({super.key, required this.namePlace, required this.stars, required this.descriptionPlace});



  @override
  Widget build(BuildContext context) {


    final starHalf = Container (
      margin: const EdgeInsets.only(
          top: 353.0,
          right: 3.0
      ),

      child: const Icon(
        Icons.star_half,
        color:  Color(0xFFf2C611),
      ),
    );

    final star = Container (
      margin: const EdgeInsets.only(
        top: 353.0,
        right: 3.0
      ),

      child: const Icon(
        Icons.star,
        color:  Color(0xFFf2C611),
      ),
    );

    final titleStars = Row (
      children: <Widget>[
        Container (
          margin: const EdgeInsets.only(
            top: 350.0,
            left: 20.0,
            right: 20.0
          ),

          child: Text(
            namePlace,
            style: const TextStyle(
              fontFamily: "Lato",
              fontSize: 30.0,
              fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,
          ),

        ),

        Row(
          children: <Widget>[
            star,
            star,
            star,
            star,
            starHalf
          ],
        )


      ],
    );

    final description = Container(
      margin: const EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0

      ),
      child: Text(
        descriptionPlace,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)
        ),

      ),
    );

    void onPressedPurpleButton () {

    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        titleStars,
        description,
        ButtonPurple(
          buttonText: "Navigate",
          onPressed: onPressedPurpleButton,
        )
      ],
    );


  }

}