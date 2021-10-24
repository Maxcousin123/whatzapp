import 'package:flutter/material.dart';
import 'package:whatzapp/components/contact_list_tile.dart';
import 'package:whatzapp/screens/search_screen.dart';


class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
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
                  Color(0xFFff3053)
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, SearchScreen.id);
              },
              child: Text(
                'add contacts',
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
        // ListView(
        //   padding: const EdgeInsets.all(3),
        //   children: [
        //     ContactTile(
        //       title: 'Chat for everyone',
        //       image: NetworkImage(
        //           'https://www.pngkey.com/png/full/126-1260580_image-freeuse-download-families-clipart-birthday-party-party.png'),
        //       clock: '',
        //       onTap: () {
        //         Navigator.pushNamed(context, Messages.id);
        //       },
        //     ),
        //   ],
        //
        //
        // ),



        ],

      ),
    );
  }
}
