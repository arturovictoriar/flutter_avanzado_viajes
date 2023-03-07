import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_avanzado_viajes/Place/model/place.dart';
import 'package:flutter_avanzado_viajes/User/model/user.dart';
import 'package:flutter_avanzado_viajes/User/repository/cloud_firestore_api.dart';
import 'package:flutter_avanzado_viajes/User/ui/widgets/profile_place.dart';

class CloudFirestorageRespository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(UserModel user) => _cloudFirestoreAPI.updateUserData(user);
  Future<void> updatePlaceDataFirestore(Place place) => _cloudFirestoreAPI.updatePlaceData(place);
  Stream<QuerySnapshot> placeListStream() => _cloudFirestoreAPI.placeListStream();
  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreAPI.buildPlaces(placesListSnapshot);
}
