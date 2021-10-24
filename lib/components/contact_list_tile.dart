import 'package:flutter/material.dart';

class ContactTile extends StatefulWidget {
  ContactTile(
      {required this.title,
      required this.image,
      required this.clock,
      required this.onTap});

  final String title;
  final ImageProvider image;
  final String clock;
  final Function() onTap;

  @override
  _ContactTileState createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,

      child: ListTile(
        title: Text(widget.title),
        leading: CircleAvatar(backgroundImage: widget.image),
        onTap: widget.onTap,

      ),
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     Text(widget.clock),
      //
      //     Text(widget.clock),
      //
      //   ],
      // ),
    );
  }
}
