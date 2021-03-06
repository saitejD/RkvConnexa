import 'package:flutter/material.dart';

class ShowArtScreen extends StatefulWidget {
  final String image;

  const ShowArtScreen({Key key, this.image}) : super(key: key);
  @override
  _ShowArtScreenState createState() => _ShowArtScreenState();
}

class _ShowArtScreenState extends State<ShowArtScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: InteractiveViewer(
        // transformationController: _controller,
        //         onInteractionEnd: (details) {
        //           _controller.value = Matrix4.identity();
        //         },
        child: Hero(
          tag: 'assets/images/1.jpg',
          child: Container(
            // margin: const EdgeInsets.all(20.0),
            // padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  widget.image,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
