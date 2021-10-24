import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatzapp/constants.dart';
import 'package:whatzapp/components/button.dart';
import 'package:whatzapp/navigaton_bar.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  User? user;
  final textController = TextEditingController();
  final textController2 = TextEditingController();

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
              controller: textController2,
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
              controller: textController,
              onChanged: (value) {
                password = value;
              },
              decoration:
                  kBoxDecoration.copyWith(hintText: 'Enter your password'),
            ),
            RoundedButton(
              color: Color(0xFFd94369),
              title: 'Login',
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                  user = userCredential.user;
                  if (user != null) {
                    print(user!.email);
                    Navigator.pushNamedAndRemoveUntil(
                        context, NavigationBar.id, (_) => true);
                    textController.clear();
                    textController2.clear();
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

//TODO: make a wrong password  or email warning
//TODO: clear textFields when login in successfully
