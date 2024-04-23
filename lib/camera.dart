import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:rightbin/consts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  dynamic selection = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_rounded,
                      color: fg,
                      size: 64,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Search",
                        style: sch,
                      ),
                    )
                  ]),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      _pickImage(1);
                    },
                    style: ebs,
                    child: Container(
                      child: Row(children: [
                        Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(Icons.image_rounded)),
                        Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text("Gallery"))
                      ]),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (await Permission.camera.request().isGranted) {
                        _pickImage(0);
                      }
                    },
                    style: ebs,
                    child: Row(children: [
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(Icons.photo_camera_rounded)),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("Camera"))
                    ])),
              ]),
          const SizedBox(
            height: 16,
          ),
          (selection != false)
              ? Image.file(selection)
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                      "Select an image from your gallery or click a photo using your camera to analyze for waste disposal.",
                      style: fs),
                ),
        ],
      ),
    ));
  }

  Future _pickImage(int n) async {
    final image = await ImagePicker()
        .pickImage(source: n == 1 ? ImageSource.gallery : ImageSource.camera);
    if (image == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) => () async {
          selection = File(image.path);
          final InputImage input = selection;
          final mode = DetectionMode.single;
          final options = ObjectDetectorOptions(
              mode: mode, classifyObjects: true, multipleObjects: false);
          final objectDetector = ObjectDetector(options: options);
          final List<DetectedObject> objects =
              await objectDetector.processImage(input);

          for (DetectedObject detectedObject in objects) {
            // final rect = detectedObject.boundingBox;
            // final trackingId = detectedObject.trackingId;

            for (Label label in detectedObject.labels) {
              print('${label.text} ${label.confidence}');
            }
          }
          objectDetector.close();
        });
  }
}
