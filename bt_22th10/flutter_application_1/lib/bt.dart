import 'package:flutter/material.dart';

class bt extends StatelessWidget {
  const bt({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isDesktop = size.width > 900;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ICON TRÊN CÙNG
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.notifications, size: 36),
                  SizedBox(width: 15),
                  Icon(Icons.extension, size: 36),
                ],
              ),

              const SizedBox(height: 25),

              /// TEXT WELCOME
              const Text(
                "Welcome,",
                style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Charlie",
                style: TextStyle(
                  fontSize: 52,
                ),
              ),

              const SizedBox(height: 25),

              /// SEARCH
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 105),

              /// TITLE
              const Text(
                "Saved Places",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              /// GRID
              Expanded(
                child: GridView.count(
                  crossAxisCount: isDesktop ? 4 : 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: isDesktop ? 1.4 : 1,
                  children: const [
                    PlaceCard("assets/images/anh1.jpg"),
                    PlaceCard("assets/images/anh2.jpg"),
                    PlaceCard("assets/images/anh3.jpg"),
                    PlaceCard("assets/images/anh4.jpg"),
                    PlaceCard("assets/images/anh4.jpg"),
                    PlaceCard("assets/images/anh3.jpg"),
                    PlaceCard("assets/images/anh2.jpg"),
                    PlaceCard("assets/images/anh1.jpg"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ================= PLACE CARD =================
class PlaceCard extends StatelessWidget {
  final String imageUrl;
  const PlaceCard(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.shade300,
            child: const Icon(
              Icons.image_not_supported,
              size: 40,
            ),
          );
        },
      ),
    );
  }
}
