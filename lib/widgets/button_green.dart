import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  final String text;
  final double width;
  final double heigth;
  final VoidCallback onPressed;
  const ButtonGreen({super.key, required this.onPressed, required this.text, required this.width, required this.heigth});

  @override
  State createState () {
    return _ButtonGreen();
  }
}

class _ButtonGreen extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: const EdgeInsets.only(
            top: 30.0,
            left: 20.0,
            right: 20.0
        ),
        width: widget.width,
        height: widget.heigth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 150, 226, 120),
                Color(0xFF1cbb78)
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp

            )

        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 18.0,
              fontFamily: "Lato",
              color: Colors.white
            ),

          ),
        ),
      ),
    );
  }
}