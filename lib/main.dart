import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/loggedIn.dart';
import 'package:flutter_authentication/provider/google_sign_in.dart';
import 'package:flutter_authentication/sign_up_page.dart';
import 'package:flutter_authentication/user_page.dart';
import 'package:flutter_authentication/users_list.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FirebaseAuth.instance.useEmulator('localhost');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>GoogleSignInProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: UsersList(),
       /* StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
           if(snapshot.connectionState ==ConnectionState.waiting){
             return Center(child: CircularProgressIndicator(),);
           }
           else if(snapshot.hasData){
             return LoggedIn();
           }
           else if(snapshot.hasError){
             return Center(child: Text('Some thing is wrong'),);
           }
           return SignUp();
          },
        ),*/
      ),
    );
  }
}

