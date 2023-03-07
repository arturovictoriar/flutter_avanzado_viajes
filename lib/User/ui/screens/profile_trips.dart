import 'package:flutter/material.dart';
import 'package:flutter_avanzado_viajes/User/ui/screens/profile_header.dart';
import 'package:flutter_avanzado_viajes/widgets/gradient_back.dart';
import '../widgets/profile_places_list.dart';


class ProfileTrips extends StatelessWidget {
  const ProfileTrips({super.key});
  @override
  Widget build(BuildContext context) {

    /*return Container(
      color: Colors.indigo,
    );*/
    return Stack(
      children: <Widget>[
        const GradientBack(
          title: '',
          heigth: 300.0,
        ),
        ListView(
          children: const <Widget>[
            ProfileHeader(),
            ProfilePlacesList()

          ],
        ),
      ],
    );
  }

}