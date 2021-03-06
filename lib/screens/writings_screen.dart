import 'package:RkvConnexa/screens/show_writings_screen.dart';
import 'package:RkvConnexa/screens/upload_writings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WritingsScreen extends StatefulWidget {
  final String type;

  const WritingsScreen({Key key, @required this.type}) : super(key: key);
  @override
  _WritingsScreenState createState() => _WritingsScreenState();
}

class _WritingsScreenState extends State<WritingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Writings"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => UploadWritingsScreen(type: widget.type)));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => ShowWritingsScreen(),
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(10),
                      ),
                  child: Container(
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(10),
                        ),
                    height: 150,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/book_cover.jpg'),
                                fit: BoxFit.cover),
                            // borderRadius: BorderRadius.circular(10),
                          ),
                          height: 150,
                          width: 120,
                        ),
                        Expanded(
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "A wonderful Night",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),
                      ],
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
