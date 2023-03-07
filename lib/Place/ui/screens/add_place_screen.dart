import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avanzado_viajes/Place/model/place.dart';
import 'package:flutter_avanzado_viajes/Place/ui/widgets/card_image.dart';
import 'package:flutter_avanzado_viajes/Place/ui/widgets/text_input_location.dart';
import 'package:flutter_avanzado_viajes/User/bloc/block_user.dart';
import 'package:flutter_avanzado_viajes/widgets/button_purple.dart';
import 'package:flutter_avanzado_viajes/widgets/gradient_back.dart';
import 'package:flutter_avanzado_viajes/widgets/title_header.dart';
import 'package:flutter_avanzado_viajes/widgets/text_input.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class AddPlaceScreen extends StatefulWidget {
  final File? image;

  const AddPlaceScreen({super.key, required this.image});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen>{
  @override
  Widget build(BuildContext context) {
    final controllerTitlePlace = TextEditingController();
    final controllerDescriptionPlace = TextEditingController();
    final controllerLocationPlace = TextEditingController();
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    void addImage () {

    }

    void savePlace () {
      User? user = userBloc.currentUser;
      File? image = widget.image;

      if (user == null || image == null) {
        throw UnimplementedError();
      }
      String path = "${user.uid}/${DateTime.now().toString()}.jpg";
      userBloc.uploadFile(path, image).then((UploadTask uploadTask) {
        uploadTask.then((TaskSnapshot snapshot) {
          snapshot.ref.getDownloadURL().then((urlImage) {
            userBloc.updatePlaceData(Place(
            name: controllerTitlePlace.text,
            description: controllerDescriptionPlace.text,
            likes: 0,
            urlImage: urlImage
          )).whenComplete(() {
            Navigator.pop(context);
          });
          });
        });
      });
    }

    String getPathImage () {
      File? image = widget.image;

      if (image != null) {
        return image.path;
      }

      return 'assets/img/beach_palm.jpeg';
    }
    double screenWidth = MediaQuery.of(context).size.width;
    double height = 300.0;
    double width = 350.0;
    double top = 0;
    double left = 0;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const GradientBack(
            title: '',
            heigth: 300.0,
          ),
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_left,
                      color: Colors.white,
                      size: 45.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                  ),
                ),
              ),
              Flexible(
                child: SizedBox (
                  width: screenWidth,
                  child: Container (
                    padding: const EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
                    child: const TitleHeader(
                      title: "Add a new place",
                    ),
                  ),
                )
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    height: height,
                    width: width,
                    top: top,
                    left: left,
                    pathImage: getPathImage(),
                    onPressedFabIcon: addImage,
                    iconData: Icons.camera_alt,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top:20.0,bottom: 20.0),
                  child: TextInput(
                    hintText: "Title",
                    inputType: null,
                    controller: controllerTitlePlace,
                    maxLines: 1
                  ),
                ),
                TextInput(
                  hintText: "Description",
                  inputType: TextInputType.multiline,
                  controller: controllerDescriptionPlace,
                  maxLines: 4
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hintText: "Add location",
                    controller: controllerLocationPlace,
                    iconData: Icons.location_on,
                  ),
                ),
                SizedBox (
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Add Place",
                    onPressed: savePlace,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}