import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'kit/camera_view.dart';
import 'kit/face_detector_painter.dart';

class FaceDetectorView extends StatefulWidget {
  @override
  _FaceDetectorViewState createState() => _FaceDetectorViewState();
}

class _FaceDetectorViewState extends State<FaceDetectorView> {
  FaceDetector faceDetector =
      GoogleMlKit.vision.faceDetector(FaceDetectorOptions(
    enableContours: true,
    enableClassification: true,
  ));
  bool isBusy = false;
  CustomPaint customPaint;
  int number = 0;

  @override
  void dispose() {
    faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final agrs = ModalRoute.of(context).settings.arguments;
    final Map<String, dynamic> data = agrs;

    return Container(
      height: 200,
      child: CameraView(
        title: data['username'],
        customPaint: customPaint,
        onImage: (inputImage) {
          processImage(inputImage);
        },
        initialDirection: CameraLensDirection.front,
        param: number,
        username: data['username'],
        device: data['device'],
        token: data['token'],
      ),
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (isBusy) return;
    isBusy = true;
    final faces = await faceDetector.processImage(inputImage);
    print('Found ${faces.length} faces');
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = FaceDetectorPainter(faces, inputImage.inputImageData.size,
          inputImage.inputImageData.imageRotation);
      customPaint = CustomPaint(painter: painter);
    } else {
      customPaint = null;
    }
    print(customPaint);
    isBusy = false;
    if (mounted) {
      setState(() {});
    }
    setState(() {
      number = faces.length;
    });
  }
}
