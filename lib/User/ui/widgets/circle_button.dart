import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool mini;
  final IconData icon;
  final double iconSize;
  final Color color;

  const CircleButton({super.key, required this.mini, required this.icon, required this.iconSize, required this.color, required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return _CircleButton();
  }

}

class _CircleButton extends State<CircleButton> {

  void onPressedButton() {

  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
          backgroundColor: widget.color,
          mini: widget.mini,
          onPressed: widget.onPressed,
          heroTag: null,
          child: Icon(
            widget.icon,
            size: widget.iconSize,
            color: const Color(0xFF4268D3),
          ),
        )
    );
  }
}