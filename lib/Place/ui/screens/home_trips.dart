import 'package:flutter/material.dart';
import 'package:flutter_avanzado_viajes/Place/ui/widgets/description_place.dart';
import 'package:flutter_avanzado_viajes/Place/ui/screens/header_appbar.dart';
import 'package:flutter_avanzado_viajes/Place/ui/widgets/review_list.dart';
// import 'package:flutter_avanzado_viajes/widgets/gradient_back.dart';

class HomeTrips extends StatelessWidget {
  final String descriptionDummy = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  const HomeTrips({super.key});
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            DescriptionPlace(
              namePlace: "Bahamas",
              stars: 4, 
              descriptionPlace: descriptionDummy
            ),
            const ReviewList()

          ],
        ),
        const HeaderAppBar()
      ],
    );
  }

}