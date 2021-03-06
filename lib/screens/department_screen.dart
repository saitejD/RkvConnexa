import 'package:RkvConnexa/screens/academic_file_show.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectDepartmentScreen extends StatefulWidget {
  @override
  _SelectDepartmentScreenState createState() => _SelectDepartmentScreenState();
}

class _SelectDepartmentScreenState extends State<SelectDepartmentScreen> {
  List<String> departmentList = [
    "Biology",
    "Chemical Engineering",
    "Chemistry",
    'Civil Engineering',
    'Coputer Science and Enginerring',
    'Electrnoics and Communication Engg',
    'Electrical and Electronics Engineering',
    'English',
    'Fine Arts',
    'Information Technology',
    'Library and Information Science',
    'Mathematics',
    'Mechanical Enginerring',
    'Metallurgical and Meterial Engineering',
    'Physical Education',
    'Physics',
    'Telugu'
  ];
  List<String> departmenImages = [
    "assets/images/depart_biology.png",
    "assets/images/depart_chemical.png",
    "assets/images/depart_chemistry.png",
    "assets/images/depart_civil.png",
    "assets/images/depart_cse.png",
    "assets/images/depart_ece.png",
    "assets/images/depart_eee.png",
    "assets/images/depart_english.png",
    "assets/images/depart_arts.png",
    "assets/images/depart_it.png",
    "assets/images/depart_library.png",
    "assets/images/depart_maths.png",
    "assets/images/depart_mech.png",
    "assets/images/depart_mme.png",
    "assets/images/depart_sports.png",
    "assets/images/depart_physics.png",
    "assets/images/depart_telugu.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Select Department"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: departmentList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => AcademicFileShow(
                      image: departmenImages[index],
                    ),
                  ),
                );
              },
              child: Card(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(20)),
                  height: 50,
                  child: Center(
                    child: Text(
                      departmentList[index],
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
