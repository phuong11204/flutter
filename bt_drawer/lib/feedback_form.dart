import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController rateCtrl = TextEditingController();
  final TextEditingController contentCtrl = TextEditingController();

  String notice = "";

  OutlineInputBorder borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Colors.grey),
  );

  // Hàm build InputDecoration theo mẫu đề
  InputDecoration buildInput(String label, IconData icon,
      {bool multi = false}) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontSize: 15),
      prefixIcon: Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 5,
          top: multi ? 12 : 0, // căn icon cho ô nhiều dòng
        ),
        child: Icon(
          icon,
          size: 22,
          color: Colors.grey[700],
        ),
      ),
      prefixIconConstraints: const BoxConstraints(
        minWidth: 0,
        minHeight: 0,
      ),
      alignLabelWithHint: multi,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 14,
      ),
      border: borderStyle,
      enabledBorder: borderStyle,
      focusedBorder: borderStyle,
    );
  }

  void sendFeedback() {
    String name = nameCtrl.text.trim();
    String rate = rateCtrl.text.trim();
    String content = contentCtrl.text.trim();

    if (name.isEmpty || rate.isEmpty || content.isEmpty) {
      setState(() => notice = "Vui lòng điền đầy đủ thông tin!");
      return;
    }

    int? star = int.tryParse(rate);
    if (star == null || star < 1 || star > 5) {
      setState(() => notice = "Đánh giá sao phải từ 1 đến 5!");
      return;
    }

    setState(() => notice = "Gửi phản hồi thành công!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gửi phản hồi"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Họ tên
            TextField(
              controller: nameCtrl,
              decoration: buildInput("Họ tên", Icons.person_outline),
            ),
            const SizedBox(height: 20),

            // Đánh giá sao
            TextField(
              controller: rateCtrl,
              keyboardType: TextInputType.number,
              decoration:
                  buildInput("Đánh giá (1 - 5 sao)", Icons.star_border),
            ),
            const SizedBox(height: 20),

            // Nội dung góp ý
            TextField(
              controller: contentCtrl,
              maxLines: 4,
              decoration: buildInput(
                "Nội dung góp ý",
                Icons.feedback_outlined, 
                multi: true,
              ),
            ),
            const SizedBox(height: 30),

            // Nút gửi phản hồi
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: sendFeedback,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.send_rounded,
                        color: Colors.white), // icon nút
                    SizedBox(width: 8),
                    Text(
                      "Gửi phản hồi",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Thông báo
            Text(
              notice,
              style: TextStyle(
                fontSize: 16,
                color: notice == "Gửi phản hồi thành công!"
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
