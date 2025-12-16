import 'package:bt_drawer/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 

import 'my_home_page.dart'; // bài 1
import 'bt.dart'; // bài 2
import 'Classroom.dart'; // bài 3
import 'my_place.dart'; // bài 4
import 'change_color_app.dart'; // bài 5
import 'counter_app.dart'; // bài 6
import 'form_dk_taikhoan.dart'; // bài 7
import 'dangnhap.dart'; // bài 8
import 'bmi.dart'; // bài 9
import 'feedback_form.dart'; // bài 10
import 'my_product.dart'; // bài 11
import 'home_screen.dart'; // bài 12
import 'form_dangnhap.dart' hide MyWidget; // bài 13

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'BÀI TẬP FLUTTER',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _item(context, 'Bài 1 - Hello', const MyHomePage()),
                  _item(context, 'Bài 2 - Calculate', const bt()),
                  _item(context, 'Bài 3 - Màn hình di động', const ClassroomScreen()),
                  _item(context, 'Bài 4 - plance', const MyPlace_1()),
                  _item(context, 'Bài 5 - Đổi màu', const ChangeColorApp()),
                  _item(context, 'Bài 6 - Counter', const CounterApp()),
                  _item(context, 'Bài 7 - Form đăng ký', const RegisterForm()),
                  _item(context, 'Bài 8 - Form đăng nhập', const MyWidget()),
                  _item(context, 'Bài 9 - BMI', const BMIScreen()),
                  _item(context, 'Bài 10 - Feedback', const FeedbackScreen()),
                  _item(context, 'Bài 11 - Product', const MyProduct()),
                  _item(context, 'Bài 12 - News API', const HomeScreen()),
                  _item(context, 'Bài 13 - Login API', const MyWidget()),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const SizedBox.shrink(),
    );
  }

  /// Header Drawer với link GitHub luôn hiển thị
  Widget _buildHeader() {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'MENU BÀI TẬP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () async {
              const url = 'https://github.com/phuong11204/flutter'; 
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
              }
            },
            child: const Text(
              'https://github.com/phuong11204/flutter',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Item Drawer
  ListTile _item(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
    );
  }
}
