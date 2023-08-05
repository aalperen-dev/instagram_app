import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/resources/storage_method.dart';

import 'package:instagram_app/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign up
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "some error occurred";

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // kullanıcı ok register
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // user uid yazdirma
        print(cred.user!.uid);

        // resim yükleme ve adresini alma
        String photoUrl = await StorageMethods()
            .upluadImageToStorage('profilePics', file, false);

        // user modelini kullanma
        model.UserModel user = model.UserModel(
          email: email,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          username: username,
          bio: bio,
          followers: [],
          following: [],
        );

        // kullanıcıyı database'e ekleme
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = 'success';
      }
    }

    // on FirebaseAuthException catch (error) {
    //   if (error.code == 'invalid-email') {
    //     res = 'Email format is wrong!';
    //   } else if (error.code == 'weak-password') {
    //     res = 'Your password is weak!';
    //   }
    // }

    catch (e) {
      res = e.toString();
    }
    return res;
  }

  // logging in user

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "some error occurred!";

    try {
      // alanlar boş değilse login olacak
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "please enter all the fiedls";
      }
    }
    // on FirebaseAuthException catch (error) {
    //   if (error.code == 'user-not-found') {
    //     res = 'user not found';
    //   } else if (error.code == ' wrong-password') {
    //     res = 'wrong password';
    //   }
    // }
    catch (e) {
      res = e.toString();
    }
    return res;
  }
}
