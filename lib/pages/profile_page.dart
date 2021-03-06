import 'package:RkvConnexa/screens/edit_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static File _image;

  _imageFromGalery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 100);
    setState(() {
      _image = image;
    });
  }

  _imageFromCamer() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 100);
    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text("Gallery"),
                  onTap: () {
                    _imageFromGalery();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text("Camera"),
                  onTap: () {
                    _imageFromCamer();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: ClipPath(
        clipper: OvalBottomBorderClipper(),
        child: Container(
            width: size.width,
            height: size.height * 0.6,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.white, spreadRadius: 10)]),
            child: Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Container(
                  //   width: 140,
                  //   height: 140,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     image: DecorationImage(
                  //         image: AssetImage('assets/images/35.jpg'),
                  //         fit: BoxFit.cover),
                  //   ),
                  // ),
                  CircleAvatar(
                    radius: 53,
                    backgroundColor: Color(0xffFDCF09),
                    child: _image == null
                        ? Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(50)),
                            width: 100,
                            height: 100,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              _image,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Sai Tej',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10),
                  Text('saitej.1919@gmail.com'),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) => EditProfileScreen())),
                        child: Column(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          blurRadius: 15,
                                          spreadRadius: 10)
                                    ]),
                                child: Icon(
                                  Icons.edit,
                                  size: 35,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'EDIT INFO',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: GestureDetector(
                          onTap: () => _showPicker(context),
                          child: Column(
                            children: [
                              Container(
                                width: 85,
                                height: 85,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.pink,
                                              Colors.pinkAccent,
                                            ],
                                          ),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                blurRadius: 15,
                                                spreadRadius: 10)
                                          ]),
                                      child: Icon(
                                        Icons.camera_alt,
                                        size: 45,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      bottom: 8,
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                blurRadius: 15,
                                                // spreadRadius: 10,
                                              )
                                            ]),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.pinkAccent,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'ADD INFO',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          blurRadius: 15,
                                          spreadRadius: 10)
                                    ]),
                                child: Icon(
                                  Icons.settings,
                                  size: 35,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('SETTINGS',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.withOpacity(0.8)))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
