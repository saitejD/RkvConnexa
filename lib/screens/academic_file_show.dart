import 'package:flutter/material.dart';

class AcademicFileShow extends StatefulWidget {
  // final TransformationController _controller = TransformationController();
  final String image;

  const AcademicFileShow({Key key, this.image}) : super(key: key);

  @override
  _AcademicFileShowState createState() => _AcademicFileShowState();
}

class _AcademicFileShowState extends State<AcademicFileShow> {
  @override
  Widget build(BuildContext context) {
    // Duration duration = Duration(milliseconds: 100);
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
    );
  }
}
