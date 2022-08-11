

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/provider/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget{
  _SignUpState createState()=> _SignUpState();
}
class _SignUpState extends State<SignUp>{
  Key? key;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Spacer(),
          FlutterLogo(),
          Spacer(),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Welcome To our System',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Login in to Continue',
              style: TextStyle(
                fontSize: 16
              ),
            ),
          ),

            ElevatedButton.icon(
              icon: FaIcon(FontAwesomeIcons.google,color: Colors.red),
              label: Text('Sign up with Google'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity,50)
              ),
              onPressed: (){
                final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                provider.login();
              },
            ),
          SizedBox(height: 40,),
          RichText(
              text: TextSpan(
                text: 'Already have account ?',
                children: [
                  TextSpan(
                    text: 'login',
                    style: TextStyle(decoration: TextDecoration.underline)
                  )
                ]
              )
          ),
        ],
      ),
    );
  }
}