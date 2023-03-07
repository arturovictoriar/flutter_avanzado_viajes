import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_avanzado_viajes/User/repository/firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<UserCredential?> signInFirebase() => _firebaseAuthAPI.signIn();

  void signOut() => _firebaseAuthAPI.signOut();
}