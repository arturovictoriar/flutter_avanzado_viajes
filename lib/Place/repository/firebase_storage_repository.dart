import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_avanzado_viajes/Place/repository/firebase_storage_api.dart';

class FirebaseStorageRepository {
  final _firebaseStorageAPI = FirebaseStorageAPI();
  Future<UploadTask> uploadFileFirestore(String path, File image) => _firebaseStorageAPI.uploadFile(path, image);
}