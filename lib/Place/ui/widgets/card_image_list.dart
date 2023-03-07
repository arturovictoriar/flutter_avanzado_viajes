import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {
  const CardImageList({super.key});

  @override
  Widget build(BuildContext context) {

    void onPressedLikeIcon () {

    }

    double height = 350.0;
    double width = 250.0;
    double top = 80.0;
    double left = 20.0;

    return SizedBox (
      height: 350.0,
      child: ListView(
        padding: const EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(
            height: height,
            width: width,
            top: top,
            left: left,
            pathImage: "assets/img/beach_palm.jpeg",
            onPressedFabIcon: onPressedLikeIcon,
            iconData: Icons.favorite_border
          ),
          CardImageWithFabIcon(
            height: height,
            width: width,
            top: top,
            left: left,
            pathImage: "assets/img/mountain.jpeg",
            onPressedFabIcon: onPressedLikeIcon,
            iconData: Icons.favorite_border
          ),
          CardImageWithFabIcon(
            height: height,
            width: width,
            top: top,
            left: left,
            pathImage: "assets/img/mountain_stars.jpeg",
            onPressedFabIcon: onPressedLikeIcon,
            iconData: Icons.favorite_border
          ),
          CardImageWithFabIcon(
            height: height,
            width: width,
            top: top,
            left: left,
            pathImage: "assets/img/river.jpeg",
            onPressedFabIcon: onPressedLikeIcon,
            iconData: Icons.favorite_border
          ),
          CardImageWithFabIcon(
            height: height,
            width: width,
            top: top,
            left: left,
            pathImage: "assets/img/sunset.jpeg",
            onPressedFabIcon: onPressedLikeIcon,
            iconData: Icons.favorite_border
          ),
        ],
      ),
    );
  }

}