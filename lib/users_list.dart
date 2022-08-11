import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/user_page.dart';

import 'model/user.dart';

class UsersList extends StatefulWidget{
  _UsersListState createState()=> _UsersListState();
}
class _UsersListState extends State<UsersList>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Stream<List<User>> readUser() => FirebaseFirestore.instance.collection('users')
        .snapshots()
        .map((snapshots) =>snapshots.docs.map((doc) => User.fromJson(doc.data())).toList()
    );
    Future<User?> readOne()async {
     final docUser = FirebaseFirestore.instance.collection('users').doc('my -id');
     final snapshot = await docUser.get();

     if(snapshot.exists){
       return User.fromJson(snapshot.data()!);
     }

    }
      Widget buildUser(User user){
        return ListTile(
          leading: CircleAvatar(child: Text(user.age.toString())),
          title: Text(user.name),
          subtitle: Text(user.birthday.toIso8601String()),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: Text('All Users'),
        ),
        body: StreamBuilder<List<User>>(
          stream: readUser(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              final users = snapshot.data!;
              return ListView(
                  children: users.map(buildUser).toList()
              );
            }else if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()),);
            }
            else {
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => UserPage()));
          },
          child: Icon(Icons.add),
        ),
      );
    }
  }
