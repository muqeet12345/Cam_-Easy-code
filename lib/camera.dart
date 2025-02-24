import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _mediaFile;
  bool _isVideo = false;
  final ImagePicker _picker = ImagePicker();
  VideoPlayerController? _videoController;

  // 📸 Capture Image
  Future<void> _capturePhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _mediaFile = File(image.path);
        _isVideo = false;
        _videoController?.dispose(); // Stop video if new image is captured
      });
    }
  }

  // 🎥 Record Video
  Future<void> _recordVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    if (video != null) {
      setState(() {
        _mediaFile = File(video.path);
        _isVideo = true;
      });

      _videoController?.dispose();
      _videoController = VideoPlayerController.file(_mediaFile!)
        ..initialize().then((_) {
          setState(() {});
          _videoController!.play();
        });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WhatsApp Style Camera")),
      body: Column(
        children: [
          Expanded(
            child: _mediaFile != null
                ? _isVideo && _videoController != null && _videoController!.value.isInitialized
                ? AspectRatio(
              aspectRatio: _videoController!.value.aspectRatio,
              child: VideoPlayer(_videoController!),
            )
                : Image.file(_mediaFile!, fit: BoxFit.cover, width: double.infinity)
                : Center(child: Text("No media captured")),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: _capturePhoto, // Short tap -> Capture photo
            onLongPress: _recordVideo, // Long press -> Record video
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.camera, color: Colors.white, size: 40),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
