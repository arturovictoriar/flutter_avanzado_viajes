// import 'package:flutter/material.dart';
import 'package:flutter_avanzado_viajes/Place/model/place.dart';

class UserModel {
  final String? uid;
  final String? name;
  final String? email;
  final String? photoURL;
  final List<Place>? myPlaces;
  final List<Place>? myFavoritePlaces;

  const UserModel(
    {
      key,
      required this.uid,
      required this.name,
      required this.email,
      required this.photoURL,
      this.myPlaces,
      this.myFavoritePlaces
    }
  );
}