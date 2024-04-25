import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:rightbin/consts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

Future<String> getModelPath(String asset) async {
  final path = '${(await getApplicationSupportDirectory()).path}/$asset';
  await Directory(dirname(path)).create(recursive: true);
  final file = File(path);
  if (!await file.exists()) {
    final byteData = await rootBundle.load(asset);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  }
  return file.path;
}

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  dynamic selection = false;
  dynamic out = 'owo';

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
          Text(
            out,
            style: fs,
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

  Future<void> _pickImage(int n) async {
    final image = await ImagePicker().pickImage(
      source: n == 1 ? ImageSource.gallery : ImageSource.camera,
    );

    if (image == null) {
      print("Image selection canceled");
      return;
    }

    setState(() {
      out = "Processing image...";
    });

    final modelPath = await getModelPath('lib/assets/model.tflite');
    final options = LocalObjectDetectorOptions(
      mode: DetectionMode.stream,
      modelPath: modelPath,
      classifyObjects: true,
      multipleObjects: false,
    );

    final objectDetector = ObjectDetector(options: options);

    final File selection = File(image.path);
    final InputImage input = InputImage.fromFile(selection);

    try {
      final List<DetectedObject> objects =
          await objectDetector.processImage(input as InputImage);
      print(objects);

      setState(() {
        out = "Detected objects:";
        for (DetectedObject detectedObject in objects) {
          final List<Label> labels = detectedObject.labels;
          if (labels.isNotEmpty) {
            out +=
                "\nLabel: ${labels[0].text}, Confidence: ${labels[0].confidence}";
          } else {
            out += "\nNo labels detected for this object";
          }
        }
      });
    } catch (e) {
      setState(() {
        out = "Error: $e";
      });
    } finally {
      objectDetector.close();
    }
  }
}
