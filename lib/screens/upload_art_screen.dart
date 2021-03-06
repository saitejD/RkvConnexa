import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadArtScreen extends StatefulWidget {
  final String type;

  const UploadArtScreen({Key key, @required this.type}) : super(key: key);
  @override
  _UploadArtScreenState createState() => _UploadArtScreenState();
}

class _UploadArtScreenState extends State<UploadArtScreen> {
  File _image;

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
    return Scaffold(
        appBar: AppBar(
          title: Text("Upload ${widget.type}"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: Container(
                        height: 60,
                        width: 110,
                        child: new RaisedButton(
                          color: Colors.blue,
                          onPressed: () {
                            _showPicker(context);
                          },
                          child: Text(
                            "Choose File",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        maxLength: 30,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Title",
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: _image != null
                      ? Image.file(
                          _image,
                          fit: BoxFit.cover,
                        )
                      : Icon(
                          Icons.photo,
                        ),
                ),
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: new RaisedButton(
                      color: Colors.blue,
                      onPressed: () {},
                      child: Text(
                        "Upload",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
