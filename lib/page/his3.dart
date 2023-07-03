//import 'appbarhis.dart';
//import 'api.dart';
//import 'page.dart';
import 'package:biofuture/model/apiHistory.dart';
import 'package:biofuture/model/user_model.dart';
import 'package:biofuture/widgets/appbarhis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'UserModel.dart';

class HistoryOnTest2 extends StatefulWidget {
  @override
  HistoryOnTestState createState() => HistoryOnTestState();
}

class HistoryOnTestState extends State<HistoryOnTest2> {
  CrudMethods crudMethods = new CrudMethods();
  QuerySnapshot? posSnapShot;

  @override
  void initState() {
    crudMethods.getData().then((result) {
      setState(() {
        posSnapShot = result;
      });
    });
    super.initState();
  }

  //final String name = '';
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  Widget build(BuildContext context) {
    var uid;
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: appbarHis(context),
      body: Container(
        padding: EdgeInsets.all(2),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("research_post")
              .where('author', arrayContains: ['$uid']).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text("No upload"),
              );
            }
            return HistoryList();
          },
        ),
      ),
    );
  }

  Widget HistoryList() {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 5),
        itemCount: posSnapShot!.docs.length,
        itemBuilder: (context, index) {
          return HistoryTile(
            author: posSnapShot!.docs[index].get("author"),
            title: posSnapShot!.docs[index].get("title"),
          );
        },
      ),
    );
  }
}

class HistoryTile extends StatelessWidget {
  final String author, title;

  HistoryTile({
    required this.author,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Column(children: <Widget>[
                ListTile(
                  title: Text(
                    author,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
