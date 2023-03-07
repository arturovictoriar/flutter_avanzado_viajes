// import 'package:flutter_avanzado_viajes/User/repository/firebase_auth_api.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_avanzado_viajes/Place/model/place.dart';
import 'package:flutter_avanzado_viajes/Place/repository/firebase_storage_repository.dart';
import 'package:flutter_avanzado_viajes/User/model/user.dart';
import 'package:flutter_avanzado_viajes/User/ui/widgets/profile_place.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:flutter_avanzado_viajes/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_avanzado_viajes/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();

  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User?> get authStatus => streamFirebase;

  User? get currentUser => FirebaseAuth.instance.currentUser;

  // Login
  Future<UserCredential?> signIn() => _authRepository.signInFirebase();

  // Logout
  void signOut() => _authRepository.signOut();

  // registrar usuario DB
  final _cloudFirestoreRepository = CloudFirestorageRespository();
  void updateUserData(UserModel user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceDataFirestore(place);
  Stream placeListStream() => _cloudFirestoreRepository.placeListStream();
  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepository.buildPlaces(placesListSnapshot);
  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<UploadTask> uploadFile(String path, File image) => _firebaseStorageRepository.uploadFileFirestore(path, image);

  @override
  void dispose() {

  }
}