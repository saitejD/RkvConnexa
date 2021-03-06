import 'package:flutter/material.dart';

Widget talentCards() {
  return Container(
    height: 250,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: 250,
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    "DST",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    '40 reads',
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
