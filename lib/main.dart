import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'componentes/slider.dart';

void main() {
  hideStatusBar();
  runApp(Principal());
}

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Piano(),
    );
  }
}

class Piano extends StatefulWidget {
  @override
  _PianoState createState() => _PianoState();
}

class _PianoState extends State<Piano> {
  Future<bool> _atrasPresionado() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Center(
              child: Text('¿Cerrar la aplicacion?'),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  color: Colors.green[300],
                  child: Text(
                    'Quedarse',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  color: Colors.red[400],
                  child: Text(
                    'Salir',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                    exit(0);
                  },
                ),
              ],
            ),
          ),
        ) ??
        false;
  }

  @override
  void initState() {
    super.initState();
    setOrientacion();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _atrasPresionado,
      child: Scaffold(
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

hideStatusBar() async {
  await SystemChrome.setEnabledSystemUIOverlays([]);
}
