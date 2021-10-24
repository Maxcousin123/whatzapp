import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 50.0,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0xFFff3053),
                ),
              ),
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Warning !'),
                  content: const Text('Are you sure you want to sign out ?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('NO'),
                    ),
                    TextButton(
                      onPressed: () {
                        _auth.signOut();
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      child: const Text('YES'),
                    ),
                  ],
                ),
              ),
              child: Text(
                'sign out',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 10.0,
          ),

          Container(
            width: double.infinity,
            height: 50.0,
            color: Color(0xFF802e42),
            child: Text('make a change app style button'),
          ),
        ],
      ),
    );
  }
}
