import 'package:flutter/material.dart';
import 'form_dangnhap.dart'; 

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> userData;

  const ProfileScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text("Thông tin cá nhân"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      (userData["image"] ?? "").toString().isNotEmpty
                          ? userData["image"]
                          : "https://via.placeholder.com/150",
                    ),
                  ),
                  const SizedBox(height: 16),

                  Text(
                    "${userData["firstName"] ?? ''} ${userData["lastName"] ?? ''}".trim(),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  Text(
                    userData["username"] != null ? "@${userData["username"]}" : "",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),

                  const SizedBox(height: 20),
                  _section("Thông tin cá nhân"),
                  _row("Email", userData["email"] as String?),
                  _row("Số điện thoại", userData["phone"] as String?),
                  _row("Giới tính", userData["gender"] as String?),
                  _row("User ID", (userData["id"] != null) ? "${userData["id"]}" : null),
                ],
              ),
            ),
          ),

          // Nút đăng xuất cố định cuối màn hình
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: SizedBox(
              width: 320,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 14, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: const Icon(Icons.logout),
                label: const Text(
                  "Đăng xuất",
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                 
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MyWidget()),
                    (route) => false,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.blue.shade300)),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _row(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Flexible(
            child: Text(
              value ?? "",
              textAlign: TextAlign.right,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
