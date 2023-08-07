import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String username;
  final String uid;
  // post bilgileri
  final String postId;
  final String description;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;
  final likes;

  // constructor
  const PostModel({
    required this.username,
    required this.uid,
    // post bilgileri
    required this.postId,
    required this.description,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.likes,
  });

  static PostModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return PostModel(
      username: snapshot['username'],
      uid: snapshot['uid'],
      postId: snapshot['postId'],
      description: snapshot['description'],
      datePublished: snapshot['datePublished'],
      postUrl: snapshot['postUrl'],
      profImage: snapshot['profImage'],
      likes: snapshot['likes'],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "postId": postId,
        "description": description,
        "datepublished": datePublished,
        "postUrl": postUrl,
        "profImage": profImage,
        "likes": likes,
      };
}
