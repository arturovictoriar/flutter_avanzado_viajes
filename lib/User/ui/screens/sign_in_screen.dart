import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avanzado_viajes/platzi_trips_cupertino.dart';
import 'package:flutter_avanzado_viajes/widgets/button_green.dart';
import 'package:flutter_avanzado_viajes/widgets/gradient_back.dart';
import 'package:flutter_avanzado_viajes/User/bloc/block_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:flutter_avanzado_viajes/User/model/user.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State createState () {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {

  UserBloc? userBloc;
  double? screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of(context);
    return _handldeCurrentSession();
  }

  Widget _handldeCurrentSession () {
    return StreamBuilder(
      stream: userBloc?.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return singInGoogleUI();
        } else {
          return const PlatziTripsCupertino();
        }
      }
    );
  }

  Widget singInGoogleUI () {
    void signInGoogleMethod () {
      bool test = userBloc == null ? false : true;
      if (test) {
        userBloc?.signOut();
        userBloc?.signIn().then((UserCredential? user) => {
          if (user != null) {
            userBloc?.updateUserData(UserModel(
              uid: user.user?.uid,
              name: user.user?.displayName,
              email: user.user?.email,
              photoURL: user.user?.photoURL
            ))
          }
        });
      } else {
        print("Hola Arturo");
      }
    }
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const GradientBack(
            title: "",
            heigth: null,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  width: screenWidth,
                  height: 100,
                  child: const Text(
                    "Welcome to \n Clothcy",
                    style: TextStyle(
                      fontSize: 37.0,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ),
              ButtonGreen(
                text: "Login with Gmail",
                width: 300,
                heigth: 50,
                onPressed: signInGoogleMethod,
              )
            ],
          )
        ],
      ),
    );
  }
}