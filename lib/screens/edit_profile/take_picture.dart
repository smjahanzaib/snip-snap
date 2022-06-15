import 'dart:math' as math;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:SnipSnap/configs/app_globals.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/main.dart';
import 'package:SnipSnap/utils/console.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({Key key}) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // Not cameras on emulator...
    if (getIt.get<AppGlobals>().cameras.isNotEmpty) {
      _initCamera(getIt.get<AppGlobals>().cameras.first);
    }
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();

    super.dispose();
  }

  // Init camera
  Future<void> _initCamera(CameraDescription description) async {
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      description,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    try {
      _initializeControllerFuture = _controller.initialize();
      // refresh screen
      setState(() {});
    } catch (e) {
      Console.log('ERROR', e, error: e);
    }
  }

  void _toggleCameraLens() {
    // get current lens direction (front / rear)
    final CameraLensDirection lensDirection =
        _controller.description.lensDirection;
    CameraDescription newDescription;
    if (lensDirection == CameraLensDirection.front) {
      newDescription = getIt.get<AppGlobals>().cameras.firstWhere(
          (CameraDescription description) =>
              description.lensDirection == CameraLensDirection.back,
          orElse: () => null);
    } else {
      newDescription = getIt.get<AppGlobals>().cameras.firstWhere(
          (CameraDescription description) =>
              description.lensDirection == CameraLensDirection.front,
          orElse: () => null);
    }

    if (newDescription != null) {
      _initCamera(newDescription);
    } else {
      Console.log('ERROR', 'Camera not available');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).takePictureTitle),
        actions: <Widget>[
          if (getIt.get<AppGlobals>().cameras.length > 1)
            IconButton(
              icon: const Icon(Icons.switch_camera),
              onPressed: _toggleCameraLens,
            ),
        ],
      ),
      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            final double rotation = _controller.description.lensDirection ==
                    CameraLensDirection.front
                ? math.pi
                : 0;
            return Container(
              color: Colors.black87,
              child: Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,

                  /// https://github.com/flutter/flutter/issues/27650#issuecomment-612129766
                  child: Transform(
                    alignment: Alignment.center,
                    child: CameraPreview(_controller),
                    transform: Matrix4.rotationY(rotation),
                  ),
                ),
              ),
            );

            //return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: getIt.get<AppGlobals>().cameras.isNotEmpty
          ? FloatingActionButton(
              child: const Icon(Icons.camera_alt),
              // Provide an onPressed callback.
              onPressed: () async {
                // Take the Picture in a try / catch block. If anything goes wrong,
                // catch the error.
                try {
                  // Ensure that the camera is initialized.
                  await _initializeControllerFuture;

                  // Construct the path where the image should be saved using the
                  // pattern package.
                  final String path = join(
                    // Store the picture in the temp directory.
                    // Find the temp directory using the `path_provider` plugin.
                    (await getTemporaryDirectory()).path,
                    '${DateTime.now()}.png',
                  );

                  // Attempt to take a picture
                  await _controller.takePicture(path);

                  // If the picture was taken return it
                  Navigator.pop(context, path);
                } catch (e) {
                  // If an error occurs, log the error to the console.
                  Console.log('ERROR', e, error: e);
                }
              },
            )
          : null,
    );
  }
}
