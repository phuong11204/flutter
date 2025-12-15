import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  bool hidePassword = true;
  bool errorUser = false;
  bool errorPass = false;

  void dangNhap() {
    setState(() {
      errorUser = userController.text.isEmpty;
      errorPass = passController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4F8),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tiêu đề
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF4A90E2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "Form Đăng nhập",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Username
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  labelText: "Tên người dùng",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              // Dòng lỗi username
              if (errorUser)
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tên người dùng không được để trống",
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                ),

              const SizedBox(height: 15),

              // Password
              TextField(
                controller: passController,
                obscureText: hidePassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: "Mật khẩu",
                  suffixIcon: IconButton(
                    icon: Icon(
                      hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              // Dòng lỗi password
              if (errorPass)
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mật khẩu không được để trống",
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                ),

              const SizedBox(height: 30),

              // Button đăng nhập
              SizedBox(
                width: 140,
                height: 42,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.login, size: 18),
                  label: const Text("Đăng nhập"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A90E2),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: dangNhap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
