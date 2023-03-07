import 'package:flutter/material.dart';
import 'package:flutter_avanzado_viajes/User/bloc/block_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../../Place/model/place.dart';

class ProfilePlacesList extends StatefulWidget {
  const ProfilePlacesList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfilePlacesList();
  }

}

class _ProfilePlacesList extends State<ProfilePlacesList> {
  final Place place = Place(
    name: 'Knuckles Mountains Range',
    description: 'Hiking. Water fall hunting. Natural bath',
    urlImage: 'https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    likes: 0
  );
  final Place place2 = Place(
    name: 'Mountains',
    description: 'Hiking. Water fall hunting. Natural bath',
    urlImage: 'https://images.unsplash.com/photo-1524654458049-e36be0721fa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    likes: 0
  );

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
      margin: const EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child: StreamBuilder(
        stream: userBloc.placeListStream(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
            print(snapshot.data);
              return Column(
                      children: userBloc.buildPlaces(snapshot.data.docs)
                    );
            case ConnectionState.none:
            case ConnectionState.waiting:
            default:
              return const CircularProgressIndicator();
          }
        }
      )
    );

    /*
    Column(
        children: <Widget>[
          ProfilePlace(
            place: place),
          ProfilePlace(
            place:place2),
        ],
      ),
    */
  }

}