import 'package:flutter/material.dart';
import 'package:flutter_avanzado_viajes/widgets/gradient_back.dart';
import 'package:flutter_avanzado_viajes/Place/ui/widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({super.key});
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: const <Widget>[
        GradientBack(
          title: 'Bienvenido',
          heigth: 255.0
        ),
        CardImageList()
      ],
    );
  }

}