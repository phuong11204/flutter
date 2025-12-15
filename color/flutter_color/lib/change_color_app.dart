import 'dart:math'; 
import 'package:flutter/material.dart';

class ChangeColorApp extends StatefulWidget {
  const ChangeColorApp({super.key});

  @override
  State<ChangeColorApp> createState() => _ChangeColorAppState();
}

class _ChangeColorAppState extends State<ChangeColorApp> {
  Color currentColor = Colors.purple;

  final List<Color> colors = [
    Colors.purple,
    Colors.orangeAccent,
    Colors.pinkAccent,
    Colors.redAccent,
    Colors.teal,
    Colors.blueAccent,
    Colors.indigo,
  ];

  String getColorName(Color color) {
    if (color == Colors.purple) return "Tím";
    if (color == Colors.orangeAccent) return "Cam";
    if (color == Colors.pinkAccent) return "Hồng";
    if (color == Colors.redAccent) return "Đỏ";
    if (color == Colors.teal) return "Xanh ngọc";
    if (color == Colors.blueAccent) return "Xanh dương";
    if (color == Colors.indigo) return "Xanh đậm";
    return "Không xác định";
  }

  void changeColor() {
    setState(() {
      final random = Random();
      currentColor = colors[random.nextInt(colors.length)];
    });
  }

  void resetColor() {
    setState(() {
      currentColor = Colors.purple;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentColor,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          " Ứng dụng Đổi màu nền",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Màu hiện tại",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              getColorName(currentColor),
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: changeColor,
                  icon: const Icon(Icons.color_lens),
                  label: const Text("Đổi màu"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: resetColor,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Đặt lại"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
