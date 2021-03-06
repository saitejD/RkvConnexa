import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Text(
              "Edit Profile",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 15),
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 10),
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/35.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      child: Icon(Icons.edit_outlined, color: Colors.white),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Colors.white),
                          color: Colors.green),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            TextField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: "Full Name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Dar Alex",
                // hintStyle: TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: "Email ",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "abc@gmail.com",
                // hintStyle: TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: "Password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "**********",
                suffixIcon: Icon(Icons.sync_disabled_outlined),
                // hintStyle: TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: "Add Bio",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "blab blab blab",
                // hintStyle: TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black),
              ),
            ),
            SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new OutlineButton(
                  onPressed: null,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'CANCEL',
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.black),
                  ),
                ),
                new RaisedButton(
                  onPressed: null,
                  color: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
