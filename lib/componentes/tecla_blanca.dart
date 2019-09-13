import 'package:flutter/material.dart';
import 'sonido.dart';

class TeclaBlanca extends StatefulWidget {
  final int nota;
  final String notaTono;
  final AssetImage imagen;

  TeclaBlanca({this.nota, this.notaTono, this.imagen});

  @override
  _TeclaBlancaState createState() => _TeclaBlancaState();
}

class _TeclaBlancaState extends State<TeclaBlanca> {
  double _spreadRadio = 0.0;
  double _blurRadio = 0.0;

  void quitSombra() {
    setState(() {
      _spreadRadio = 0.0;
      _blurRadio = 0.0;
    });
  }

  void setSombra() {
    setState(() {
      _spreadRadio = -6.0;
      _blurRadio = 6.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTapDown: (TapDownDetails tapDownDetails) {
          setSombra();
          pianoSonido(widget.nota, widget.notaTono);
        },
        onTapUp: (TapUpDetails tapUpDetails) {
          quitSombra();
        },
        onTapCancel: () {
          quitSombra();
        },
        child: Container(
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4.0),
            image: DecorationImage(
              image: widget.imagen,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[600],
                offset: Offset(0.0, 0.0),
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                spreadRadius: _spreadRadio,
                blurRadius: _blurRadio,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
