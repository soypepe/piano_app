import 'package:flutter/material.dart';
// import 'package:audioplayers/audio_cache.dart';
import 'sonido.dart';

// class TeclaBlanca extends StatelessWidget {
//   final Color color;
//   final int nota;
//   TeclaBlanca({this.color, this.nota});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       // child: FlatButton(
//       //     splashColor: Colors.yellow,
//       //     color: color,
//       //     onPressed: () {
//       //       pianoSonido(nota);
//       //     }),
//       child: GestureDetector(
//         onTapDown: (TapDownDetails tapDownDetails) {
//           pianoSonido(nota, 's');
//         },
//         child: Container(
//           margin: EdgeInsets.all(2.0),
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(4.0),
//           ),
//         ),
//       ),
//       // child: FlatButton(
//       //   // padding: EdgeInsets.all(17.0),
//       //   shape: RoundedRectangleBorder(
//       //     borderRadius: BorderRadius.circular(8.0),
//       //   ),
//       //   highlightColor: Colors.black,
//       //   splashColor: Colors.transparent,
//       //   color: color,
//       //   onPressed: () {
//       //     pianoSonido(nota, 's');
//       //   },
//       // ),
//     );
//   }

//   // void pianoSonido(int nota, String tono) {
//   //   // print('nota: $nota');
//   //   final player = AudioCache();
//   //   // player.play('note$nota$tono.mp3');
//   //   player.play('note$nota$tono.wav');
//   // }
// }

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
    _spreadRadio = 0.0;
    _blurRadio = 0.0;
  }

  void setSombra() {
    _spreadRadio = -6.0;
    _blurRadio = 6.0;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTapDown: (TapDownDetails tapDownDetails) {
          pianoSonido(widget.nota, widget.notaTono);
          setState(() {
            setSombra();
          });
        },
        onTapUp: (TapUpDetails tapUpDetails) {
          setState(() {
            quitSombra();
          });
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
