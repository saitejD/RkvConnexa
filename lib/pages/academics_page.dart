import 'package:RkvConnexa/screens/academic_file_show.dart';
import 'package:RkvConnexa/screens/department_screen.dart';
import 'package:RkvConnexa/widgets/buildCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AcademicsPage extends StatefulWidget {
  @override
  _AcademicsPageState createState() => _AcademicsPageState();
}

class _AcademicsPageState extends State<AcademicsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 10),
            buildCard(
              context,
              Colors.redAccent,
              Icons.school,
              "Administration",
              "Tap to know Administraion of the campus",
              () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => AcademicFileShow(
                      image: 'assets/images/administration.jpg',
                    ),
                  ),
                );
              },
            ),
            buildCard(
              context,
              Colors.deepPurple,
              Icons.date_range,
              "Academic Calender",
              "Calender for this academic year",
              () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => AcademicFileShow(
                      image: 'assets/images/academicCalendar.png',
                    ),
                  ),
                );
              },
            ),
            buildCard(
              context,
              Colors.blueGrey,
              Icons.local_hospital,
              "Hospital",
              "Tap to know the Hospital fecility of the campus",
              () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => AcademicFileShow(
                      image: 'assets/images/hospital.png',
                    ),
                  ),
                );
              },
            ),
            buildCard(
              context,
              Colors.teal,
              Icons.restaurant_menu,
              "Mess Timetable",
              "Tap to view complete mess time table",
              () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => AcademicFileShow(
                      image: 'assets/images/mess.png',
                    ),
                  ),
                );
              },
            ),
            buildCard(
              context,
              Colors.indigoAccent,
              Icons.business,
              "Offices",
              "Tap to know the Offices which can help you to find ease",
              () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => AcademicFileShow(
                      image: 'assets/images/offices.png',
                    ),
                  ),
                );
              },
            ),
            buildCard(
              context,
              Colors.deepOrangeAccent,
              Icons.account_balance_sharp,
              "CDPC",
              "Tap to know the people at CDPC office",
              () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => AcademicFileShow(
                      image: 'assets/images/cdpc.png',
                    ),
                  ),
                );
              },
            ),
            buildCard(
              context,
              Colors.cyan,
              Icons.people_rounded,
              "Faculty",
              "Tap to view all Branches faculty working currenly",
              () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => SelectDepartmentScreen(),
                  ),
                );
              },
            ),
            buildCard(
                context,
                Colors.lime,
                Icons.mail_outline,
                "Mess Complanints",
                "Tap to complete on Mess with a valid proof like a photo",
                null),
          ],
        ),
      ),
    );
  }
}
