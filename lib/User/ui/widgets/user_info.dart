import 'package:flutter/material.dart';
import 'package:flutter_avanzado_viajes/User/model/user.dart';

class UserInfoWidget extends StatefulWidget {

  final UserModel user;

  const UserInfoWidget({super.key, required this.user});

  @override
  State<StatefulWidget> createState() {
    return _UserInfoWidget();
  }

}

class _UserInfoWidget extends State<UserInfoWidget> {

  String getNameFromUser () {
    if (widget.user.name != null) {
      return '${widget.user.name}';
    }
    return '';
  }

  String getEmailFromUser () {
    if (widget.user.email != null) {
      return '${widget.user.email}';
    }
    return '';
  }

  String getPhotoUrlFromUser () {
    if (widget.user.photoURL != null) {
      return '${widget.user.photoURL}';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {

    final userPhoto = Container(
      width: 90.0,
      height: 90.0,
      margin: const EdgeInsets.only(
          right: 20.0
      ),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white,
              width: 2.0,
              style: BorderStyle.solid
          ),
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              // image: AssetImage(user.imgProfile)
              image: NetworkImage(getPhotoUrlFromUser())
          )
      ),
    );

    final userInfoWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(
                bottom: 5.0
            ),
            child: Text(
                getNameFromUser(),
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Lato',
                )
            )
        ),
        Text(
            getEmailFromUser(),
            style: const TextStyle(
                fontSize: 15.0,
                color: Colors.white30,
                fontFamily: 'Lato'
            )
        ),
      ],
    );

    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 0.0
      ),
      child: Row(
        children: <Widget>[
          userPhoto,
          userInfoWidget
        ],
      ),
    );
  }

}