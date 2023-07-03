import 'package:biofuture/model/user_model.dart';
import 'package:biofuture/page/ForumComment.dart';
import 'package:biofuture/page/chat_room.dart';
import 'package:biofuture/widgets/appbar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OthersProfile extends StatefulWidget {
  String author;

  OthersProfile({
    required this.author,
  });

  @override
  OthersProfileState createState() => OthersProfileState(author: this.author);
}

class OthersProfileState extends State<OthersProfile> {
  String author;
  UserModel loggedInUser = UserModel();
  QuerySnapshot? userSnapShot;
  //profile _profile = new profile();

  OthersProfileState({required this.author});

  /*@override
  void initState() {
    _profile.getUser(author).then((result) {
      setState(() {
        userSnapShot = result;
      });
    });
    super.initState();
  }*/

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(author)
        .get()
        .then((value) {
      //userSnapShot = UserModel.fromMap(value.data());
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.chat_bubble),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ChatRoom()));
              },
            )
          ],
        ),
        body: Container(
          child: ListView(
            children: [
              ProfileCustom(),
              const SizedBox(height: 50),
              buildName(),
              const SizedBox(height: 24),
              //Divider(color: Colors.blueGrey[100]),
              const SizedBox(height: 24),
              buildAbout(),
            ],
          ),
        ));
  }

  Widget ProfileCustom() {
    return Column(
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
            Image(
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg')),
            Positioned(
                bottom: -80,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage("${loggedInUser.urlAvatar}"),
                ))
          ],
        ),
        SizedBox(height: 40),
      ],
    );
  }

  Widget ProfilePic() {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: NetworkImage("${loggedInUser.urlAvatar}"), //assign the url
          fit: BoxFit.cover,
          width: 100,
          height: 128,
        ),
      ),
    );
  }

  Widget buildName() => Column(
        children: [
          Text(
            "${loggedInUser.name}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            "${loggedInUser.email}",
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "${loggedInUser.about}",
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
