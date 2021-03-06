import 'package:RkvConnexa/screens/show_art_screen.dart';
import 'package:RkvConnexa/screens/upload_art_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArtsScreen extends StatefulWidget {
  final String type;

  const ArtsScreen({Key key, @required this.type}) : super(key: key);
  @override
  _ArtsScreenState createState() => _ArtsScreenState();
}

class _ArtsScreenState extends State<ArtsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.type),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => UploadArtScreen(type: widget.type))),
        child: Icon(Icons.add),
      ),
      body: Container(
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: 20,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ShowArtScreen(
                      image: 'assets/images/1.jpg',
                    ),
                  ),
                );
              },
              child: Container(
                height: 150,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/1.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
