import 'package:flutter/material.dart';
import 'package:whatzapp/navigaton_bar.dart';
import 'package:whatzapp/screens/login_screen.dart';
import 'package:whatzapp/screens/register_screen.dart';
import 'package:whatzapp/screens/registeration_data_screen.dart';
import 'package:whatzapp/screens/welcome_screen.dart';
import 'package:whatzapp/screens/chats_screen.dart';
import 'package:whatzapp/screens/messaging_screen.dart';
import 'package:whatzapp/screens/search_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        ChatScreen.id : (context) => ChatScreen(),
        RegisterScreen.id : (context) => RegisterScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        NavigationBar.id : (context) => NavigationBar(),
        Messages.id : (context) => Messages(),
        RegisterDataScreen.id : (context) => RegisterDataScreen(),
        SearchScreen.id : (context) => SearchScreen(),

      },
      title: 'whatzapp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}

//TODO: prevent landscape view #DONE
