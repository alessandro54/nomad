import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as v;

class ARTextWidget extends StatefulWidget {
  final String text;

  ARTextWidget(this.text);

  @override
  _ARTextWidgetState createState() => _ARTextWidgetState();
}

class _ARTextWidgetState extends State<ARTextWidget> {
  late ARKitController arKitController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AR Text'),
      ),
      body: ARKitSceneView(
        onARKitViewCreated: onARKitViewCreated,
      )
    );
  }

  void onARKitViewCreated(ARKitController controller) {
    arKitController = controller;
    final textNode = ARKitNode(
      scale: v.Vector3(0.1, 0.1, 0.1),
      eulerAngles: v.Vector3(-90, 0, 0),
      geometry: ARKitText(
        text: widget.text,
        extrusionDepth: 1,
        materials: [
          ARKitMaterial(
            diffuse: ARKitMaterialProperty.color(Colors.deepOrange),
          )
        ],
      ),
      position: v.Vector3(0, 0, 0)
    );

    arKitController.add(textNode);
  }

  @override
  void dispose() {
    arKitController.dispose();
    super.dispose();
  }
}