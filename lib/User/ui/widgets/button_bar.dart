import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_avanzado_viajes/Place/ui/screens/add_place_screen.dart';
import 'package:flutter_avanzado_viajes/User/bloc/block_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'circle_button.dart';

class ButtonsBar extends StatefulWidget {
  const ButtonsBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ButtonsBar();
  }
}

class _ButtonsBar extends State<ButtonsBar>{
  UserBloc? userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    void restartUserPassword () {
      print("Restart User Password Method Here");
    }
    void addPlaces () {
      ImagePicker imagePicker = ImagePicker();
      imagePicker.pickImage(
        source: ImageSource.camera
      ).then((XFile? xImage) {

        File? image;
        String? pathImage = xImage?.path;

        if (pathImage == null) {
          throw UnimplementedError();
        }
        image = File(pathImage);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((BuildContext context) => AddPlaceScreen(
              image: image
            ))
          )
        );
      }).catchError((onError) {
        print(onError);
      });
    }
    void signOutGoogleMethod () {
      userBloc?.signOut();
    }
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            // Cambiar contraseña
            CircleButton(
              mini: true, 
              icon: Icons.vpn_key, 
              iconSize: 20.0,
              color: const Color.fromRGBO(255, 255, 255, 0.6),
              onPressed: restartUserPassword
            ),
            // Agregar una nueva review
            CircleButton(
              mini: false, 
              icon: Icons.add, 
              iconSize: 40.0,
              color: const Color.fromRGBO(255, 255, 255, 1),
              onPressed: addPlaces
            ),
            // Cerrar session
            CircleButton(
              mini: true, 
              icon: Icons.exit_to_app, 
              iconSize: 20.0,
              color: const Color.fromRGBO(255, 255, 255, 0.6),
              onPressed: signOutGoogleMethod
            )
          ],
        )
    );
  }

}