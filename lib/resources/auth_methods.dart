import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String username,
    required String email,
    required String password,
    required String bio,
    //required Uint8List file,
}) async {
    String res = 'Some error found';

    try {

      if(username.isNotEmpty || email.isNotEmpty || password.isNotEmpty || bio.isNotEmpty
         // || file != null
      ){
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'username': username,
          'uid': userCredential.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
        });
      }

      res = "Correct";

    } catch (err){
      res = err.toString();
    }

    print(res);

    return res;

  }
}