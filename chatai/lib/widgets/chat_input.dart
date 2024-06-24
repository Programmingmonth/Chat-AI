import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () async {
              final picker = ImagePicker();
              final pickedFile = await picker.getImage(source: ImageSource.camera);
              if (pickedFile != null) {
                print('Picked image: ${pickedFile.path}');
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: () async {
              final picker = ImagePicker();
              final pickedFile = await picker.getImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                print('Picked image: ${pickedFile.path}');
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.folder),
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles();
              if (result != null) {
                print('Picked file: ${result.files.single.path}');
              }
            },
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              final message = _controller.text;
              if (message.isNotEmpty) {
                print('Sent message: $message');
                _controller.clear();
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.headset),
            onPressed: () {
              print('Headset mode activated');
            },
          ),
        ],
      ),
    );
  }
}
