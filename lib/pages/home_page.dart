import 'package:RkvConnexa/screens/places_screen.dart';
import 'package:RkvConnexa/widgets/buildCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TableRow _buildTableRow(String type, String menu) {
    return TableRow(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            type,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            menu,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Good Night",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Sai Tej",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.amberAccent),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Today's Menu",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                        Table(
                          border: TableBorder.all(width: 2),
                          columnWidths: {
                            1: FlexColumnWidth(2),
                            2: FlexColumnWidth(1),
                          },
                          children: [
                            _buildTableRow("Breakfast",
                                "Idly(4 No), Sambar, Groundnut Chutney, Bread(4), egg(1)/Banana(for veg), Jam(20 g), Coffee or Milk"),
                            _buildTableRow("Lunch",
                                "Veg Palav, Chicken Currey (150 g)/ Panneer Butter Masal Curry and Sweet, Raita, White Rice, Rasam"),
                            _buildTableRow("Snacks", "Biscuits, Tea or Milk"),
                            _buildTableRow("Dinner",
                                "Rice, Mix vegetables Sambar, Cabbage Curry, Curd, Banana"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 10),
                buildCard(
                    context,
                    Colors.cyan,
                    Icons.location_city,
                    "Places of Rkv",
                    "Tap to know status of places at Rkv",
                    () => Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => PlacesScreen()))),
                buildCard(context, Colors.redAccent, Icons.share, "Share",
                    "Let your friends know this app", null),

                // Card(
                //   color: Colors.red,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10)),
                //   child: Container(
                //       height: 100,
                //       width: double.infinity,
                //       child: Row(
                //         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.only(left: 30.0),
                //             child: Icon(
                //               Icons.share,
                //               color: Colors.amberAccent,
                //               size: 50,
                //             ),
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.only(top: 8.0),
                //             child: Column(
                //               children: [
                //                 Text(
                //                   "Share app",
                //                   style: TextStyle(
                //                       color: Colors.white,
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 22),
                //                 ),
                //                 SizedBox(height: 10),
                //                 Text(
                //                   "  Let your friends know this app",
                //                   style: TextStyle(
                //                       color: Colors.white,
                //                       fontWeight: FontWeight.w600,
                //                       fontSize: 18),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ],
                //       )),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
