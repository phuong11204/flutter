import 'package:flutter/material.dart';

class bt extends StatelessWidget {
  const bt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.notifications, size: 36),
                  SizedBox(width: 15),
                  Icon(Icons.extension, size: 36),
                ],
              ),

              const SizedBox(height: 25),
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

              const SizedBox(height: 25),
              const Text(
                "Saved Places",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: const [
                    PlaceCard("assets/images/anh1.jpg"),
                    PlaceCard("assets/images/anh2.jpg"),
                    PlaceCard("assets/images/anh3.jpg"),
                    PlaceCard("assets/images/anh4.jpg"),
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
      ),
    );
  }
}