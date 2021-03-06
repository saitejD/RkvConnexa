import 'dart:ui';

import 'package:RkvConnexa/models&data/places_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class PlacesScreen extends StatefulWidget {
  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  bool status = false;
  bool status2 = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  String title = '';

  setting(val) {
    setState(() {
      status = val;
    });
  }

  Future<void> _statusUpdateDialog(BuildContext context, DateTime time) async {
    return await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // backgroundColor: Colors.white,
          title: Text(
            "Update Place Status",
          ),
          titleTextStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blue),
          content: Container(
            height: 150,
            child: Column(
              children: [
                Text(
                  "Central Library",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Open : \t",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text(
                      time.toString(),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlutterSwitch(
                    width: 100.0,
                    height: 40.0,
                    // valueFontSize: 25.0,
                    // toggleSize: 45.0,
                    value: status,
                    borderRadius: 30,
                    padding: 8,
                    showOnOff: true,
                    activeText: "Open",
                    inactiveText: "Closed",
                    activeColor: Colors.green,
                    inactiveColor: Colors.red,
                    // inactiveClor: Colors.red,
                    onToggle: (val) {
                      setState(() {
                        print('toggling');
                        status = val;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "No",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      print(status);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "UPDATE",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Future<void> _addPlaceDialog(context, DateTime time) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          // backgroundColor: Colors.transparent,
          title: Text(
            "ADD PLACE",
          ),
          titleTextStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          content: Container(
            height: 170,
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Place name'),
                    maxLength: 50,
                    autocorrect: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Place name can not be empty!';
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
                Row(
                  children: [Text("Open: \t"), Text(time.toString())],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FlutterSwitch(
                    width: 100.0,
                    height: 40.0,
                    // valueFontSize: 14.0,
                    // toggleSize: 45.0,
                    value: status2,
                    borderRadius: 30,
                    padding: 8,
                    showOnOff: true,
                    activeText: "Open",
                    inactiveText: "Closed",
                    activeColor: Colors.green,
                    inactiveColor: Colors.red,
                    // inactiveClor: Colors.red,
                    onToggle: (value) {
                      setState(() {
                        status2 = value;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "No",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "ADD",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    PlacesList places = PlacesList();
    List<PlacesModel> _placesList = places.placesList;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var now = new DateTime.now();
          // var berlinWallFell = new DateTime.utc(1989, 11, 9);
          // var moonLanding = DateTime.parse("1969-07-20 20:18:04Z");
          // print(now);
          _addPlaceDialog(context, now);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Places of Rkv"),
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          // padding: EdgeInsets.all(10),
          itemCount: _placesList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _placesList[index].title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'status :\t',
                        style: TextStyle(color: Colors.black54),
                      ),
                      Text(
                        _placesList[index].status,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'updated :\t',
                        style: TextStyle(color: Colors.black54),
                      ),
                      Text(
                        _placesList[index].time,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      new RaisedButton(
                        color: Colors.blue,
                        onPressed: () {
                          var now = new DateTime.now();
                          // var berlinWallFell = new DateTime.utc(1989, 11, 9);
                          // var moonLanding =
                          //     DateTime.parse("1969-07-20 20:18:04Z");
                          _statusUpdateDialog(context, now);
                        },
                        child: Text(
                          "UPDATE",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                index != _placesList.length - 1
                    ? Divider(
                        color: Colors.grey,
                      )
                    : SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }
}

// statusUpdateDialog(context) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return Dialog(
//         // backgroundColor: Colors.transparent,

//         child: Column(
//           children: [
//             Text(
//               "Update Place Status",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
//             ),
//             Text(
//               "Central Library",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             Row(
//               children: [Text("Open"), Text("12:02:00 pm")],
//             ),
//             FlutterSwitch(
//               width: 125.0,
//               height: 55.0,
//               valueFontSize: 25.0,
//               toggleSize: 45.0,
//               value: status,
//               borderRadius: 30,
//               padding: 8,
//               showOnOff: true,
//               activeText: "Open",
//               inactiveText: "Closed",
//               activeColor: Colors.green,
//               inactiveColor: Colors.red,
//               // inactiveClor: Colors.red,
//               onToggle: (value) {
//                 setState(() {
//                   status = value;
//                 });
//               },
//             )
//           ],
//         ),
//         // actions: [
//         //   GestureDetector(
//         //       onTap: () {
//         //         Navigator.pop(context);
//         //       },
//         //       child: Text("No")),
//         //   GestureDetector(
//         //       onTap: () {
//         //         Navigator.pop(context);
//         //       },
//         //       child: Text("ADD")),
//         // ],
//       );
//     },
//   );
// }

// Container(
//               padding: EdgeInsets.all(10),
//               height: 150,
//               width: double.infinity,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Container(
//                     height: 150,
//                     width: 150,
//                     child: Image.asset(
//                       'assets/images/1.jpg',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           "Super Market",
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w800),
//                         ),
//                       ),
//                       Row(
//                         children: [Text("status :"), Text("Open")],
//                       ),
//                       Row(
//                         children: [Text("updated :"), Text("12:02:00")],
//                       ),
//                       RaisedButton(
//                         onPressed: null,
//                         child: Text(
//                           "Update",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             )
