

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_authentication/model/user.dart';
import 'package:flutter_authentication/users_list.dart';

class UserPage extends StatefulWidget{
  _UserPageState createState()=> _UserPageState();
}
class _UserPageState extends State<UserPage>{
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerBirthDate= TextEditingController();
  @override
  Widget build(BuildContext context) {
    InputDecoration decoration (String label)=> InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
    );
    Future createUser(User user)async{
       final docUser = FirebaseFirestore.instance.collection('users').doc();
       user.id = docUser.id;

      final json = user.toJson();
      await docUser.set(json)
          .then((value) => Navigator.push(context, new MaterialPageRoute(builder: (context) => UsersList())));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add user'),
      ),
      body:  ListView(
          padding: EdgeInsets.all(6),
          children: [
            TextField(
              controller: controllerName,
              autocorrect: true,
              decoration: decoration('Name'),
            ),
            const SizedBox(height: 24,),
            TextField(
              keyboardType: TextInputType.number,
              controller: controllerAge,
              decoration: decoration('Age'),
            ),
            const SizedBox(height: 24,),
            TextField(
              keyboardType: TextInputType.datetime,
              controller: controllerBirthDate,
              decoration: decoration('Birthday'),
            ),
            const SizedBox(height: 24,),
            ElevatedButton(
                onPressed: (){
                  final user = User(
                      name: controllerName.text, 
                      age:int.parse(controllerAge.text),
                      birthday:DateTime.now(),
                  );

                  createUser(user);
                  
                  }, 
                child: Text('Create'))
          ],
        ),

    );
  }
}