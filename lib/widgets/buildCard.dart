import 'package:flutter/material.dart';

Widget buildCard(BuildContext context, Color color, IconData icon, String title,
    String subtitle, Function tap) {
  var size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: tap,
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Card(
        elevation: 5,
        color: color,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 100,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.25,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  icon,
                  color: Colors.black,
                  size: 50,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
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
}
