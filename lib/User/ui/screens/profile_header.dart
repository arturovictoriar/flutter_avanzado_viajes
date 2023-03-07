import 'package:flutter/material.dart';
import 'package:flutter_avanzado_viajes/User/bloc/block_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../widgets/user_info.dart';
import '../widgets/button_bar.dart';
import 'package:flutter_avanzado_viajes/User/model/user.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileHeader();
  }
}

class _ProfileHeader extends State<ProfileHeader> {
  UserBloc? userBloc;
  UserModel user = const UserModel(
    uid: '',
    photoURL: '',
    name: '',
    email: ''
  );

  Widget showProfileData (AsyncSnapshot snapshot) {
      if (!snapshot.hasData || snapshot.hasError) {
        return Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 50.0
          ),
          child: Column(
            children: const <Widget>[
              CircularProgressIndicator(),
              Text("No se pudo cargar la información. Haz login")
            ],
          ),
        );
      } else {
        const title = Text(
          'Profile',
          style: TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0
          ),
        );
        user = UserModel(
          uid: snapshot.data.uid,
          photoURL: snapshot.data.photoURL,
          name: snapshot.data.displayName,
          email: snapshot.data.email
        );

        return Container(
          margin: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 50.0
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: const <Widget>[
                  title
                ],
              ),
              UserInfoWidget(
                user: user,
              ),
              const ButtonsBar()
            ],
          ),
        );
      }
    }


  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc?.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.done:
            return showProfileData(snapshot);
          case ConnectionState.none:
          case ConnectionState.waiting:
          default:
            return const CircularProgressIndicator();
        }
      }
    );
  }

}