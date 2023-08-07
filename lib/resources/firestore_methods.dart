import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/models/post.dart';
import 'package:instagram_app/resources/storage_method.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // post upload
  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String username,
    String profImage,
  ) async {
    String res = "some error occurred!";
    try {
      String photoUrl =
          await StorageMethods().upluadImageToStorage('posts', file, true);

      PostModel post = PostModel(
        username: username,
        uid: uid,
        postId: postId,
        description: description,
        datePublished: DateTime.now(),
        postUrl: postUrl,
        profImage: profImage,
        likes: likes,
      );
    } catch (e) {
      print(e);
    }
  }
}
