import 'package:flutter/material.dart';
import 'detail_screen.dart'; // Import DetailScreen

class HomePage extends StatelessWidget {
  final List<Map<String, String>> manhwaList = [
    {"title": "Ominiscient Reader Viewpoint", "imagePath": "assets/orvp.jpg"},
    {"title": "Reincarnation of The Suicidal Battle God", "imagePath": "assets/reincarnation.jpg"},
    {"title": "Return of the 8th Class Magician", "imagePath": "assets/returnof8th.jpg"},
    {"title": "Solo Leveling", "imagePath": "assets/solo.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87, 
        title: const Text(
          'Manhwa Gallery',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white), 
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Search tapped')),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.sort, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Sort tapped')),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('More options tapped')),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.black87,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.8,
          ),
          itemCount: manhwaList.length,
          itemBuilder: (context, index) {
            final manhwa = manhwaList[index];
            return manhwaCard(context, manhwa['imagePath']!, manhwa['title']!);
          },
        ),
      ),
    );
  }

  Widget manhwaCard(BuildContext context, String imagePath, String title) {
    return Card(
      elevation: 5, // Increased elevation for a more material feel
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      clipBehavior: Clip.hardEdge, // Ensures the image fits within the rounded corners
      color: Colors.grey[900], // Dark card background
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(imagePath: imagePath, title: title),
            ),
          );
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(8),
                ),
                constraints: BoxConstraints(maxWidth: 150), // Ensure the width doesn't exceed 150
                child: Text(
                  title, // Display title based on the image
                  overflow: TextOverflow.ellipsis, // Add ellipsis when the text overflows
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  maxLines: 1, // Ensure that the title stays on a single line
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
