import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_to_do_list/const/colors.dart';
import 'package:flutter_to_do_list/screen/add_note_screen.dart';
import 'package:flutter_to_do_list/screen/user.dart';
import 'package:flutter_to_do_list/widgets/stream_note.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

bool show = true;

class _Home_ScreenState extends State<Home_Screen> {
  late User _curUser;
  String _curEmail = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      floatingActionButton: Visibility(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Add_creen(),
                ));
              },
              backgroundColor: custom_green,
              child: Icon(Icons.add, size: 30),
            ),
            SizedBox(width: 16), // ปรับระยะห่างระหว่างปุ่ม
            // FloatingActionButton(
            //   onPressed: () {
            //     // เพิ่มโค้ดที่ต้องการเมื่อกดปุ่มตามต้องการ
            //   },
            //   backgroundColor: Colors.blue, // สีตัวอย่างสำหรับปุ่มที่สอง
            //   child: Icon(Icons.star, size: 30), // ไอคอนตัวอย่างสำหรับปุ่มที่สอง
            // ),
            // SizedBox(width: 16), // ปรับระยะห่างระหว่างปุ่ม
            FloatingActionButton(
              onPressed: () {
                // เพิ่มโค้ดที่ต้องการเมื่อกดปุ่มตามต้องการ
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ));
              },
              backgroundColor: Colors.blue, // สีตัวอย่างสำหรับปุ่มที่สาม
              child: Icon(Icons.person, size: 30), // ไอคอนตัวอย่างสำหรับปุ่มที่สาม
            ),
            SizedBox(width: 16),FloatingActionButton(
              onPressed: () {
                // เพิ่มโค้ดที่ต้องการเมื่อกดปุ่มตามต้องการ
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Add_creen(),
                ));
              },
              backgroundColor: Colors.red, // สีตัวอย่างสำหรับปุ่มที่สาม
              child: Icon(Icons.logout, size: 30), // ไอคอนตัวอย่างสำหรับปุ่มที่สาม
            ),
            SizedBox(width: 16),
          ],
        ),
      ),

      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                show = true;
              });
            }
            if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                show = false;
              });
            }
            return true;
          },
          child: Column(
            children: [
              Stream_note(false),
              Text(
                'isDone',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.bold),
              ),
              Stream_note(true),
            ],
          ),
        ),
      ),
    );

  }

}
