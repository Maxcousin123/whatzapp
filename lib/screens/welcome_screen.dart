import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatzapp/components/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatzapp/screens/login_screen.dart';
import 'package:whatzapp/screens/register_screen.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        // repeats the gradient over the canvas

        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/logo.png'),
                    height: 200.0,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'shit chat',
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                RoundedButton(
                    color: Color(0xFFd94369),
                    title: 'Login',
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    }),
                RoundedButton(
                  color: Color(0xFF802e42),
                  title: 'Register',
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.id);
                  },
                ),
                SizedBox(
                  height: 70.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
