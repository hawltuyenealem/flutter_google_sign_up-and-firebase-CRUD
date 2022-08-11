


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/loggedIn.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{

  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future login()async{
    try{
      final googleUser = await googleSignIn.signIn();
      if(googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken:googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );


      await FirebaseAuth.instance.signInWithCredential(credential).then((value) => new MaterialPageRoute(builder: (context)=>LoggedIn()));
    }catch(e){
      print(e);
    }

    notifyListeners();
  }
  Future logOut()async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}