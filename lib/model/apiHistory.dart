import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class CrudMethods {
  Future<void> addData(posData) async {
    print(posData);
    FirebaseFirestore.instance
        .collection("research_post")
        .add(posData)
        .then((value) => print(value))
        .catchError((e) {
      print(e);
    });
  }

getData() async {
    return await FirebaseFirestore.instance.collection("research_post").get();
  }
}

  //Future getData() async {

  //User? currentUser = FirebaseAuth.instance.currentUser;
  //var firestore = FirebaseFirestore.instance;
 // QuerySnapshot qn = await firestore.collection(currentUser?.uid?? 'uid').get();
 // return qn.docs;
//}
//}