import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatzapp/screens/settings_screen.dart';
import 'package:whatzapp/screens/chats_screen.dart';
import 'package:whatzapp/screens/calls_screen.dart';
import 'package:whatzapp/screens/contacts_screen.dart';

class NavigationBar extends StatefulWidget {
  static const String id = 'navigation_bar';

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;

  // ignore: non_constant_identifier_names
  static List<Widget> _Classes = <Widget>[
    const ChatScreen(),
    const CallsScreen(),
    const ContactsScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      appBar: AppBar(
        backgroundColor: Color(0xFFd94369),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'shit chat',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
      body: _Classes.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF802e42),
        onTap: _onItemTapped,
        elevation: 10.0,
        unselectedItemColor: Colors.black54,
        iconSize: 30.0,
        showUnselectedLabels: true,
      ),
    );
  }
}
