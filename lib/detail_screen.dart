import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String imagePath;
  final String title;

  // Constructor to pass data to this screen
  DetailScreen({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    // Hardcoded manhwa details based on the title
    String description = "A gripping story that explores the journey of the main character. Adventure, action, and drama await!";
    String author = "John Doe";
    String genre = "Action, Fantasy, Adventure";

    // Dummy chapters
    List<String> chapters = List.generate(10, (index) => 'Chapter ${index + 1}');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: null, // Remove title from the AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.download_rounded, color: Colors.white), // Download icon
            onPressed: () {
              // Implement download functionality if needed
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Download tapped')));
            },
          ),
          IconButton(
            icon: Icon(Icons.sort, color: Colors.white), // Sort icon
            onPressed: () {
              // Implement sort functionality if needed
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sort tapped')));
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white), // More options icon
            onPressed: () {
              // Implement more options functionality if needed
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('More options tapped')));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title, Image, Author, and Genre inside a Container
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        imagePath,
                        width: 100, // Image size
                        height: 150, // Image size
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 15),

                    // Title, Author, and Genre in Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),

                          // Author
                          Text(
                            "Author: $author",
                            style: TextStyle(fontSize: 16, color: Colors.white60),
                          ),
                          SizedBox(height: 4),

                          // Genre
                          Text(
                            "Genre: $genre",
                            style: TextStyle(fontSize: 16, color: Colors.white60),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Description
              Text(
                description,
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              SizedBox(height: 10),

              // Divider line below description
              Divider(color: Colors.white38),

              SizedBox(height: 20),

              // Chapter List Header
              Text(
                "Chapters:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),

              // Chapter List
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: chapters.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Implement navigation to chapter detail or reading
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tapped on ${chapters[index]}')));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(0, 2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        title: Text(
                          chapters[index],
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
