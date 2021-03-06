import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadWritingsScreen extends StatefulWidget {
  final String type;

  const UploadWritingsScreen({key, @required this.type}) : super(key: key);
  @override
  _UploadWritingsScreenState createState() => _UploadWritingsScreenState();
}

class _UploadWritingsScreenState extends State<UploadWritingsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  String title = '';
  String content = '';
  File _image;

  int selectedRatioTile;
  // int value = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRatioTile = 0;
  }

  _imageFromGalery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 100);
    setState(() {
      _image = image;
    });
    return _image;
  }

  void _uploadWriting(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Scaffold(
          bottomSheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.blue,
              height: 50,
              child: Center(
                child: Text('Publish'),
              ),
            ),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blue,
            elevation: 0,
            title: Text("Info"),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.close,
                ),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _formKey1,
                      child: TextFormField(
                        controller: _controller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Title'),
                        maxLength: 50,
                        autocorrect: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Title can not be empty!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            title = value;
                          });
                        },
                      ),
                    ),
                    Divider(),
                    Text(
                      "Add Image",
                      style: TextStyle(fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 80,
                            child: _image != null
                                ? Image.file(
                                    _image,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "assets/images/book_cover.jpg",
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          // SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.image),
                                // SizedBox(width: 10),
                                GestureDetector(
                                    onTap: () {
                                      _imageFromGalery();
                                    },
                                    child: Text("Pick from Gallery"))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Text(
                      "Content Type",
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: selectedRatioTile,
                              // title: Text('Short Story'),
                              // selected: true,

                              onChanged: (val) {
                                setState(() {
                                  selectedRatioTile = val;
                                });
                              },
                            ),
                            Text('Short Story'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue: selectedRatioTile,
                              // title: Text('Poetry'),
                              // selected: false,
                              onChanged: (val) {
                                setState(() {
                                  selectedRatioTile = val;
                                });
                              },
                            ),
                            Text('Poetry'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 3,
                              groupValue: selectedRatioTile,
                              // title: Text('Writing'),
                              // selected: false,
                              onChanged: (val) {
                                setState(() {
                                  selectedRatioTile = val;
                                });
                              },
                            ),
                            Text('Writing'),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Checkbox(onChanged: (val) {}, value: false),
                        // SizedBox(width: 20),
                        Text("I agree that the content is created by me only.")
                      ],
                    )
                  ],
                ),
              ),
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
        title: Text(widget.type),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    print('all okay');
                    _uploadWriting(context);
                  }
                },
                child: Text(
                  "Publish",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        // margin: EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: Center(
            child: TextFormField(
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
              // controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Start Writing',
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Content can not be empty!';
                }
                return null;
              },
              onSaved: (text) {
                content = text;
              },
            ),
          ),
        ),
      ),
    );
  }
}
