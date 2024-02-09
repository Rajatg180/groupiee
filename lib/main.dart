import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:groupieee/helper/helper_function.dart';
import 'package:groupieee/pages/auth/login_page.dart';
import 'package:groupieee/pages/home_page.dart';
import 'package:groupieee/shared/constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if the current device we is web then we will and option to initi
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: Constants.apiKey,
        appId: Constants.appId,
        messagingSenderId: Constants.messagingSenderId,
        projectId: Constants.messagingSenderId,
      ),
    );
  }
  // for android and ios
  else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  // if user is already loggend then we will directly redirect him to homepage else on loggin page
  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) => {
          if (value != null)
            {
              print("vaur form home page ${value}"),
              setState(() {
                _isSignedIn = value;
              }),
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Constants().primaryColor,
          scaffoldBackgroundColor: Colors.white),
      home: _isSignedIn ? const HomePage() : const LoginPage(),
    );
  }
}
