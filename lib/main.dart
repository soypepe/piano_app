import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'componentes/slider.dart';

void main() {
  setOrientacion();
  runApp(Piano());
}

class Piano extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black38,
        body: SafeArea(
          child: SliderPiano(),
        ),
      ),
    );
  }
}

setOrientacion() async {
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
}
