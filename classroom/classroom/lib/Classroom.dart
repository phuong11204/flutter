import 'package:flutter/material.dart';

class ClassroomScreen extends StatelessWidget {
  const ClassroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> classes = [
      {
        "title": "XML và ứng dụng - Nhóm 1",
        "code": "2025-2026.1.TIN4583.001",
        "students": "58 học viên",
        "image": "assets/images/anh1.jpg",
      },
      {
        "title": "Lập trình ứng dụng cho các thiết bị di động",
        "code": "2025-2026.1.TIN4403.006",
        "students": "55 học viên",
        "image": "assets/images/anh2.jpg",
      },
      {
        "title": "Lập trình ứng dụng cho các thiết bị di động",
        "code": "2025-2026.1.TIN4403.005",
        "students": "52 học viên",
        "image": "assets/images/anh3.jpg",
      },
      {
        "title": "Lập trình ứng dụng cho các thiết bị di động",
        "code": "2025-2026.1.TIN4403.004",
        "students": "50 học viên",
        "image": "assets/images/anh4.jpg",
      },
      {
        "title": "Lập trình ứng dụng cho các thiết bị di động",
        "code": "2025-2026.1.TIN4403.003",
        "students": "52 học viên",
        "image": "assets/images/anh5.jpg",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Danh sách lớp học'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: classes.length,
        itemBuilder: (context, index) {
          final c = classes[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Stack(
                children: [
                  /// ẢNH NỀN
                  Image.asset(
                    c["image"]!,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 140,
                        color: Colors.grey.shade400,
                        child: const Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),

                  /// LỚP PHỦ TỐI
                  Container(
                    height: 140,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.2),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),

                  /// NỘI DUNG
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 14,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          c["title"]!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          c["code"]!,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          c["students"]!,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// ICON MENU
                  const Positioned(
                    top: 10,
                    right: 10,
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
