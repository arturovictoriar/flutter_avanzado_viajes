import 'package:flutter/material.dart';
import '../../../widgets/floating_action_button_green.dart';

class  CardImageWithFabIcon extends StatelessWidget {

  final double height;
  final double width;
  final double top;
  final double left;
  final String pathImage;
  final VoidCallback onPressedFabIcon;
  final IconData iconData;

  const CardImageWithFabIcon({
    super.key, 
    required this.height, 
    required this.width, 
    required this.top,
    required this.left, 
    required this.pathImage,
    required this.onPressedFabIcon,
    required this.iconData
  });

  @override
  Widget build(BuildContext context) {


    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        left: left,
        top: top
      ),

      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
            image: AssetImage(pathImage)
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: const <BoxShadow>[
          BoxShadow (
            color:  Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]

      ),
    );

    return Stack(
      alignment: const Alignment(0.9,1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
          onPressed: onPressedFabIcon,
          iconData: iconData,
        )
      ],
    );
  }

}