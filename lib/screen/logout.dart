import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/const/colors.dart';
import 'package:flutter_to_do_list/screen/login.dart'; // นำเข้าหน้า Login
import 'package:firebase_auth/firebase_auth.dart'; // นำเข้า FirebaseAuth

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  _LogoutScreenState createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  late User _curUser;
  String _curEmail = "";

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    FirebaseAuth auth = FirebaseAuth.instance;
    _curUser = auth.currentUser!;
    setState(() {
      _curEmail = _curUser.email!;
    });
  }

  // ฟังก์ชันเพื่อออกจากระบบและทำการกลับไปยังหน้า Login
  void logOut(BuildContext context) async {
    // ทำการ logout จาก Firebase
    await FirebaseAuth.instance.signOut();

    // นำเรียกใช้ฟังก์ชัน Navigator.pushAndRemoveUntil เพื่อล้าง Stack ของ Route และเปลี่ยนไปยังหน้า Login
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LogIN_Screen(() {})),
          (route) => false, // ล้างทุก Route ใน Stack
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'คุณต้องการออกจากระบบหรือไม่?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // เรียกใช้ฟังก์ชัน logOut เมื่อกดปุ่มออกจากระบบ
                  logOut(context);
                },
                child: Text(
                  'ออกจากระบบ',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
