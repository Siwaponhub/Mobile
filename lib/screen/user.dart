import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/const/colors.dart';
import 'package:flutter_to_do_list/data/auth_data.dart';
import 'login.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              'Email:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.grey,
            //     minimumSize: Size(170, 48),
            //   ),
            //   onPressed: () {
            //     // Firestore_Datasource().AddNote(subtitle.text, title.text, indexx);
            //     Navigator.pop(context);
            //   },
            //   child: Text(
            //     'Logout',
            //     style: TextStyle(
            //       color: Colors.white, // เปลี่ยนสีของตัวอักษรเป็นสีขาว
            //     ),
            //   ),
            // ),
          ],
        ),
      ),

    );
  }
}
