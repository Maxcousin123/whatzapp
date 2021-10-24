import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatzapp/constants.dart';
import 'package:whatzapp/components/button.dart';
import 'package:whatzapp/navigaton_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

class RegisterDataScreen extends StatefulWidget {
  static const String id = 'register_data_screen';

  @override
  _RegisterDataScreenState createState() => _RegisterDataScreenState();
}

class _RegisterDataScreenState extends State<RegisterDataScreen> {
  late String firstName;
  late String lastName;
  final ImagePicker _picker = ImagePicker();
  final _auth = FirebaseAuth.instance;
  final database = FirebaseDatabase.instance.reference();
  final Future<FirebaseApp> _future = Firebase.initializeApp();
  File? _image;
  late String _uploadedFileURL;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  late String phoneNumber;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              textAlign: TextAlign.center,
              onChanged: (value) {
                firstName = value;
              },
              decoration:
                  kBoxDecoration.copyWith(hintText: 'Enter you first name'),
            ),
            SizedBox(
              height: 8.0,
            ),

            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                lastName = value;
              },
              decoration:
                  kBoxDecoration.copyWith(hintText: 'Enter your last name'),
            ),
            SizedBox(
              height: 8.0,
            ),

            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                phoneNumber = value;
              },
              decoration:
              kBoxDecoration.copyWith(hintText: 'Enter your phone number'),
            ),
            SizedBox(
              height: 12.0,
            ),
            _image == null
                ? RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        //print(firstName + middleName + lastName);
                        print('hello');
                        showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                color: Colors.white,
                                constraints: BoxConstraints(maxHeight: 175.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        final photo = await _picker.pickImage(
                                            source: ImageSource.camera);

                                        setState(() {
                                          Navigator.pop(context);
                                          _image = File(photo!.path);
                                        });
                                      },
                                      child: Text('Take a picture'),
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                          Size(200, 40.0),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Color(0xFFd94369),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        final image = await _picker.pickImage(
                                            source: ImageSource.gallery);
                                        setState(() async {
                                          Navigator.pop(context);
                                          _image = File(image!.path);


                                        });
                                      },
                                      child: Text('Import from gallery'),
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                          Size(200, 40.0),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Color(0xFFd94369),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      });
                    },
                    elevation: 10.0,
                    fillColor: Color(0xFFd94369),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 9.0,
                        ),
                        Text(
                          'add image',
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 16.5),
                          ),
                        ),

                          Icon(
                            Icons.add,
                            size: 25.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                    constraints:
                        BoxConstraints(minWidth: 120.0, minHeight: 120.0),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 30.0,
                      ),
                      Material(
                        elevation: 10.0,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          backgroundImage: FileImage(_image!),
                          minRadius: 65.0,
                          maxRadius: 65.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      OutlinedButton(
                        child: Text('Remove'),
                        onPressed: () {
                          setState(() {
                            _image = null;
                          });
                        },
                      ),
                    ],
                  ),
            RoundedButton(
              color: Color(0xFFd94369),
              title: 'Save data',
              onPressed: () async {
                User? user = _auth.currentUser;
                var uid = user!.uid;
                print(uid);

                await firebase_storage.FirebaseStorage.instance
                    .ref('images/$uid')
                    .putFile(_image!);

                database.push().set({
                  'userID': uid,
                  'name': firstName,
                  'last': lastName
                });



                Navigator.pushNamed(context, NavigationBar.id);
              },
            ),
          ],
        ),
        ),
    );
  }
}

//
// InkWell(
//
// onTap: () {
// setState(() {
// _image = null;
// });
// },
// child: Material(
// elevation: 10.0,
// shape: CircleBorder(),
// child: CircleAvatar(
// backgroundImage: FileImage(_image!),
// minRadius: 65.0,
// maxRadius: 65.0,
// child: Text(
// 'Tap to remove image',
// textAlign: TextAlign.center,
// ),
// ),
// ),
// )
