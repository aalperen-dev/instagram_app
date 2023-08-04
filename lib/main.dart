import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/responsive/mobile_screen_layout.dart';
import 'package:instagram_app/responsive/responsive.dart';
import 'package:instagram_app/responsive/web_screen_layout.dart';
import 'package:instagram_app/screens/login_screen.dart';
import 'package:instagram_app/screens/signup_screen.dart';
import 'package:instagram_app/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBY44OvnXaXOoqLT9ObCwiUGM9qBaIGkgs",
        appId: "1:883622990757:web:932056ba387827e2ee4e4c",
        messagingSenderId: "883622990757",
        projectId: "insragram-clone-8662d",
        storageBucket: "insragram-clone-8662d.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      // home: LoginScreen(),
      home: const SignupScreen(),
    );
  }
}
