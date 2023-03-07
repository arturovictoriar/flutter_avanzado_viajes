import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_avanzado_viajes/Place/model/place.dart';
import 'package:flutter_avanzado_viajes/User/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_avanzado_viajes/User/ui/widgets/profile_place.dart';

class CloudFirestoreAPI {
  static const String users = "users";
  final String places = 'places';

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData (UserModel user,) async{
    DocumentReference ref = _db.collection(users).doc(user.uid);
    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async{
    CollectionReference refPlaces = _db.collection(places);
    User? user = _auth.currentUser;
    if (user == null) {
      throw UnimplementedError();
    }
    await refPlaces.add({
        'name': place.name,
        'description': place.description,
        'likes': place.likes,
        'urlImage': place.urlImage,
        'userOwner': _db.doc('users/${user.uid}')
      }
    ).then((DocumentReference dr) {
      dr.get().then((DocumentSnapshot snapshot) {
        DocumentReference ref = _db.collection(users).doc(user.uid);
        ref.update({
          'myPlaces': FieldValue.arrayUnion([_db.doc('places/${snapshot.id}')])
        });
      });
    });
  }

  Stream<QuerySnapshot> placeListStream () {
    User? user = _auth.currentUser; //Para saber el uid del usuario actual

    return _db.collection(places).where('userOwner',isEqualTo:_db.collection(users).doc(user?.uid)).snapshots(); 

  }

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot){
    List<ProfilePlace> profilePlaces = <ProfilePlace>[];

    for (var p in placesListSnapshot) {
      profilePlaces.add(ProfilePlace(
          place: Place( 
            name: p['name'],
            description: p['description'],
            urlImage: p['urlImage'])
        )
      );
    }

    return profilePlaces;


  }

}