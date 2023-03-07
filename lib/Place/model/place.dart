// import 'package:flutter/material.dart';
// import 'package:flutter_avanzado_viajes/User/model/user.dart';

class Place {
  String? id;
  String name;
  String description;
  String urlImage;
  int? likes;

  Place({
    key,
    this.id,
    required this.name,
    required this.description,
    required this.urlImage,
    this.likes
  });
}