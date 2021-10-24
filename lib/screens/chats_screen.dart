import 'package:flutter/material.dart';
import 'package:whatzapp/components/contact_list_tile.dart';
import 'package:whatzapp/screens/messaging_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  static const String id = 'chat_screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(3),
      children: [
        ContactTile(
          title: 'Chat for everyone',
          image: NetworkImage(
              'https://www.pngkey.com/png/full/126-1260580_image-freeuse-download-families-clipart-birthday-party-party.png'),
          clock: '',
          onTap: () {
            Navigator.pushNamed(context, Messages.id);
          },
        ),
      ],
    );
  }
}

//TODO: make after logging in can't return back to login screen unless press sign out
//TODO: learn state management well and keep the logged in logged in until request signing out with and are u sure warning AlertDialog
//TODO: when logging out remove all credential from the textFields
