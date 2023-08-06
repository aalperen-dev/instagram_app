import 'package:flutter/material.dart';
import 'package:instagram_app/models/user.dart';
import 'package:instagram_app/resources/auth_method.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  final AuthMethods _authMethods = AuthMethods();

  UserModel get getUser => _user!;

  Future<void> refreshUser() async {
    UserModel user = await _authMethods.getUserDetails();

    _user = user;

    notifyListeners();
  }
}
