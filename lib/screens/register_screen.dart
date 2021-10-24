import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatzapp/constants.dart';
import 'package:whatzapp/components/button.dart';
import 'package:whatzapp/screens/registeration_data_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  String email = 'l';
  String password = 'g';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset('assets/logo.png'),
                height: 150.0,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: kBoxDecoration.copyWith(hintText: 'Enter you E-mail'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration:
                  kBoxDecoration.copyWith(hintText: 'Enter your password'),
            ),
            RoundedButton(
              color: Color(0xFFd94369),
              title: 'Register',
              onPressed: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    Navigator.pushNamed(context, RegisterDataScreen.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}

//TODO: make a at least 6 characters password warning
//TODO: make an existing user warning