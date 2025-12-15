import 'package:bt_drawer/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'my_home_page.dart'; // bài 1
import 'bt.dart'; // bài 2
import 'Classroom.dart'; // bài 3
import 'change_color_app.dart'; // bài 4
import 'counter_app.dart'; // bài 5
import 'form_dk_taikhoan.dart'; // bài 6
import 'dangnhap.dart'; // bài 7
import 'bmi.dart'; // bài 8
import 'feedback_form.dart'; // bài 9
import 'my_product.dart'; // bài 10
import 'home_screen.dart'; // bài 11
import 'form_dangnhap.dart' hide MyWidget; // bài 12

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
                  _item(context, 'Bài 4 - Đổi màu', const ChangeColorApp()),
                  _item(context, 'Bài 5 - Counter', const CounterApp()),
                  _item(context, 'Bài 6 - Form đăng ký', const RegisterForm()),
                  _item(context, 'Bài 7 - Form đăng nhập', const MyWidget()),
                  _item(context, 'Bài 8 - BMI', const BMIScreen()),
                  _item(context, 'Bài 9 - Feedback', const FeedbackScreen()),
                  _item(context, 'Bài 10 - Product', const MyProduct()),
                  _item(context, 'Bài 11 - News API', const HomeScreen()),
                  _item(context, 'Bài 12 - Login API', const MyWidget()),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const SizedBox.shrink(), 
    );
  }

  /// Header Drawer 
  Widget _buildHeader() {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: const Center(
        child: Text(
          'MENU BÀI TẬP',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
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
