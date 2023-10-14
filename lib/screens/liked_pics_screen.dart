// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:instagram_app/utils/colors.dart';

class LikedPicsScreen extends StatefulWidget {
  final String uid;
  const LikedPicsScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<LikedPicsScreen> createState() => _LikedPicsScreenState();
}

class _LikedPicsScreenState extends State<LikedPicsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Pics...'),
        backgroundColor: mobileBackgroundColor,
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('posts')
            .where('likes', arrayContains: widget.uid)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if ((snapshot.data! as dynamic).docs.length <= 0) {
            return const Center(
              child: Text(
                'You havent liked any pics...',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          return GridView.builder(
            shrinkWrap: true,
            itemCount: (snapshot.data! as dynamic).docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 1.5,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              DocumentSnapshot snap = (snapshot.data as dynamic).docs[index];
              return Image(
                image: NetworkImage(
                  snap['postUrl'],
                ),
                fit: BoxFit.cover,
              );
            },
          );
        },
      ),
    );
  }
}
