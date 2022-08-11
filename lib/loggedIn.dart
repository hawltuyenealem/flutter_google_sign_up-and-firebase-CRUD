import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoggedIn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
   return Scaffold(
     appBar: AppBar(
       title: Text('Logged In'),
       actions: [
         TextButton(onPressed: (){
           final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
           provider.logOut();
         }, child: Text(
             'log out'
         ))
       ],
     ),
     body: Container(
       alignment: Alignment.center,
       child: Column(
         children: [
           Text('Profile'),
           SizedBox(height: 32,),
           CircleAvatar(
             radius: 40,
             backgroundImage: NetworkImage(user.photoURL!),

           ),
           SizedBox(height: 10),
           Text(
             'Name: '+  user.displayName!,
             style: TextStyle(fontSize: 16,color: Colors.white),
           ),
           SizedBox(height: 10,),
           Text(
             'Email: ' + user.email!,
             style: TextStyle(fontSize: 16,color: Colors.white),
           )
         ],
       ),
     ),
   );
  }
}