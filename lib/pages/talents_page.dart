import 'package:RkvConnexa/screens/arts_screen.dart';
import 'package:RkvConnexa/screens/writings_screen.dart';
import 'package:RkvConnexa/widgets/talentCards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TalentsPage extends StatefulWidget {
  @override
  _TalentsPageState createState() => _TalentsPageState();
}

class _TalentsPageState extends State<TalentsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Writings",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => WritingsScreen(
                                  type: 'Wrings',
                                )));
                      },
                    ),
                  ],
                ),
              ),
            ),
            talentCards(),
            Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Photography",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => ArtsScreen(
                                  type: 'Photography',
                                )));
                      },
                    ),
                  ],
                ),
              ),
            ),
            talentCards(),
            Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Poetry",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => WritingsScreen(
                                  type: 'Poetry',
                                )));
                      },
                    ),
                  ],
                ),
              ),
            ),
            talentCards(),
            Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Drawings",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => ArtsScreen(
                              type: 'Drawings',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            talentCards(),
            Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Singing",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            talentCards(),
          ],
        ),
      ),
    );
  }
}
