import 'package:flutter/material.dart';

class MyPlace_1 extends StatelessWidget {
  const MyPlace_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView( // Dùng ListView để cuộn nếu nội dung dài
        children: [
          block1(),
          block2(),
          block3(),
          block4(),
        ],
      ),
    );
  }

  // Block 1: Ảnh trên cùng
  Widget block1() {
    var src =
        "https://images.unsplash.com/photo-1757258632083-e9b8a5345047?q=80&w=1171&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    return Image.network(src);
  }

  // Block 2: Tiêu đề + Địa điểm + Icon sao + số lượt
  Widget block2() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          // Tiêu đề + Địa điểm
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Oeschinen Lake Campground",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 5),
                Text(
                  "Kandersteg, Switzerland",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          // Icon sao + số lượt
          const Icon(Icons.star, color: Colors.red),
          const SizedBox(width: 5),
          const Text("41"),
        ],
      ),
    );
  }

  // Block 3: 3 icon chức năng
  Widget block3() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButton(Icons.call, "CALL"),
          buildButton(Icons.near_me, "ROUTE"),
          buildButton(Icons.share, "SHARE"),
        ],
      ),
    );
  }

  Widget buildButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.blue),
        ),
      ],
    );
  }

  // Block 4: Mô tả
  Widget block4() {
    var data =
        "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. "
        "Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. "
        "A gondola ride from Kandersteg, followed by a half-hour walk through pastures "
        "and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. "
        "Activities enjoyed here include rowing, and riding the summer toboggan run.";

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        data,
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.justify,
      ),
    );
  }
}