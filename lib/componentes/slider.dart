import 'package:flutter/material.dart';
import 'seccion_blanca.dart';
import 'carta.dart';
import 'package:piano_app/constantes.dart';

class SliderPiano extends StatefulWidget {
  @override
  _SliderPianoState createState() => _SliderPianoState();
}

class _SliderPianoState extends State<SliderPiano> {
  String _eleccionNotas = 's';
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CartaReusable(
                        presionado: () {
                          setState(() {
                            _eleccionNotas = 's';
                            _count = 0;
                          });
                        },
                        color: _eleccionNotas == 's'
                            ? kColorsonidoActivo
                            : kColorsonidoInactivo,
                        texto: 'Izquierda',
                      ),
                      CartaReusable(
                        presionado: () {
                          setState(() {
                            _eleccionNotas = 'o';
                            _count = 7;
                          });
                        },
                        color: _eleccionNotas == 'o'
                            ? kColorsonidoActivo
                            : kColorsonidoInactivo,
                        texto: 'Centro',
                      ),
                      CartaReusable(
                        presionado: () {
                          setState(() {
                            _eleccionNotas = 't';
                            _count = 14;
                          });
                        },
                        color: _eleccionNotas == 't'
                            ? kColorsonidoActivo
                            : kColorsonidoInactivo,
                        texto: 'Derecha',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SeccionBlanca(
              notaTono: _eleccionNotas,
              count: _count,
            ),
          ],
        ),
      ],
    );
  }
}
