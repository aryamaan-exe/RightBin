import 'package:flutter/material.dart';
import 'package:rightbin/consts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  dynamic selection = false;
  var client = http.Client();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    _pickImage(1);
                  },
                  style: ebs,
                  child: const Text("Choose image from gallery")),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (await Permission.camera.request().isGranted) {
                    _pickImage(0);
                  }
                },
                style: ebs,
                child: const Text("Click an image from camera")),
            const SizedBox(
              height: 16,
            ),
            (selection != false)
                ? Image.file(selection)
                : const Text("Your image will show up here"),
          ],
        ),
      ),
    ));
  }

  Future _pickImage(int n) async {
    final image = await ImagePicker()
        .pickImage(source: n == 1 ? ImageSource.gallery : ImageSource.camera);
    if (image == null) return;
    setState(() {
      selection = File(image.path);
      // objDetection();
    });
  }
}
