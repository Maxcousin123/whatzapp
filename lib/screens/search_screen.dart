import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String id = 'search_screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFd94369),
        automaticallyImplyLeading: false,

        // The search area here
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5),),
          child: Center(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      controller.clear();
                    },
                  ),
                  hintText: ' Search by E-mail',
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
    );
  }
}
