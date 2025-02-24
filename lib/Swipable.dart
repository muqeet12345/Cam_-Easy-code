import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSwipeScreen extends StatefulWidget {
  @override
  _ImageSwipeScreenState createState() => _ImageSwipeScreenState();
}

class _ImageSwipeScreenState extends State<ImageSwipeScreen> {
  List<File> images = [];

  // Function to pick images
  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null) {
      setState(() {
        images.addAll(pickedFiles.map((file) => File(file.path)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe Image Gallery"),
        backgroundColor: Colors.green,
      ),
      body: images.isEmpty
          ? Center(
        child: Text(
          "No images selected",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white, size: 30),
            ),
            secondaryBackground: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.check, color: Colors.white, size: 30),
            ),
            onDismissed: (direction) {
              setState(() {
                if (direction == DismissDirection.endToStart) {
                  images.removeAt(index); // Delete on swipe right
                }
              });
            },
            child: Card(
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  Image.file(images[index], height: 200, fit: BoxFit.cover),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Swipe left to retain, right to delete",
                        style: TextStyle(color: Colors.black54)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImages,
        backgroundColor: Colors.green,
        child: Icon(Icons.add_a_photo, color: Colors.white),
      ),
    );
  }
}