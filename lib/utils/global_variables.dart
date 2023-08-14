import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/screens/feed_screen.dart';
import 'package:instagram_app/screens/profile_screen.dart';
import 'package:instagram_app/screens/search_screen.dart';

import '../screens/add_post_screen.dart';

const webScreenSize = 600;

var homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text('p4'),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
