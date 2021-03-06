import 'package:flutter/material.dart';

class ShowWritingsScreen extends StatefulWidget {
  @override
  _ShowWritingsScreenState createState() => _ShowWritingsScreenState();
}

class _ShowWritingsScreenState extends State<ShowWritingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 200.0, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Container(
            child: Text(
              """started application in 1,606ms.

Exception caught by scheduler library 
The following assertion was thrown during a scheduler callback:
There are multiple heroes that share the same tag within a subtree.

Within each subtree for which heroes are to be animated (i.e. a PageRoute subtree), each Hero must have a unique non-null tag.
In this case, multiple heroes had the following tag: assets/images/1.jpg
Here is the subtree for one of the offending heroes: Hero
""",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
