import 'package:flutter/material.dart';
import 'sonido.dart';

// class TeclaNegra extends StatelessWidget {
//   final int nota;
//   final String notaTono;

//   TeclaNegra({@required this.nota, this.notaTono});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 1.8),
//       height: 190,
//       width: 50,
//       child: Material(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.zero,
//             topRight: Radius.zero,
//             bottomLeft: Radius.circular(8.0),
//             bottomRight: Radius.circular(8.0),
//           ),
//         ),
//         elevation: 2,
//         color: Colors.black,
//         child: GestureDetector(
//           onTapDown: (TapDownDetails tapdowndetails) {
//             pianoSonido(nota, notaTono);
//           },
//           child: InkWell(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.zero,
//               topRight: Radius.zero,
//               bottomLeft: Radius.circular(8.0),
//               bottomRight: Radius.circular(8.0),
//             ),
//             highlightColor: Colors.white,
//             splashColor: Colors.transparent,
//           ),
//         ),
//       ),
//     );
//   }
// }

class TeclaNegra extends StatefulWidget {
  final int nota;
  final String notaTono;
  final AssetImage imagen;

  TeclaNegra(
      {@required this.nota, @required this.notaTono, @required this.imagen});

  @override
  _TeclaNegraState createState() => _TeclaNegraState();
}

class _TeclaNegraState extends State<TeclaNegra> {
  double _spreadRadio = 0.0;
  double _blurRadio = 0.0;

  void quitSombra() {
    _spreadRadio = 0.0;
    _blurRadio = 0.0;
  }

  void setSombra() {
    _spreadRadio = -2.0;
    _blurRadio = 4.0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails detalles) {
        pianoSonido(widget.nota, widget.notaTono);
        setState(() {
          setSombra();
        });
      },
      onTapUp: (TapUpDetails detalles) {
        setState(() {
          quitSombra();
        });
      },
      child: Container(
        height: 190,
        width: 50,
        margin: EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.zero,
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
          ),
          image: DecorationImage(
            image: widget.imagen,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[600],
              offset: Offset(0.0, 0.0),
            ),
            BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, 0.0),
              spreadRadius: _spreadRadio,
              blurRadius: _blurRadio,
            ),
          ],
        ),
      ),
    );
  }
}
