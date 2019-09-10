import 'package:flutter/material.dart';
import 'package:piano_app/componentes/tecla_negra.dart';
import 'tecla_blanca.dart';
import 'package:piano_app/constantes.dart';

class SeccionBlanca extends StatelessWidget {
  final String notaTono;
  final int count;

  SeccionBlanca({@required this.notaTono, @required this.count});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TeclaBlanca(
                nota: 1,
                notaTono: notaTono,
                imagen: kImagenes[count + 0],
              ),
              TeclaBlanca(
                nota: 3,
                notaTono: notaTono,
                imagen: kImagenes[count + 1],
              ),
              TeclaBlanca(
                nota: 5,
                notaTono: notaTono,
                imagen: kImagenes[count + 2],
              ),
              TeclaBlanca(
                nota: 6,
                notaTono: notaTono,
                imagen: kImagenes[count + 3],
              ),
              TeclaBlanca(
                nota: 8,
                notaTono: notaTono,
                imagen: kImagenes[count + 4],
              ),
              TeclaBlanca(
                nota: 10,
                notaTono: notaTono,
                imagen: kImagenes[count + 5],
              ),
              TeclaBlanca(
                nota: 12,
                notaTono: notaTono,
                imagen: kImagenes[count + 6],
              ),
            ],
          ),
          Positioned(
            right: MediaQuery.of(context).size.width / 1.225,
            child: TeclaNegra(
              nota: 2,
              notaTono: notaTono,
              imagen: kImagenNegra[0],
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width / 1.49,
            child: TeclaNegra(
              nota: 4,
              notaTono: notaTono,
              imagen: kImagenNegra[1],
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width / 2.60,
            child: TeclaNegra(
              nota: 7,
              notaTono: notaTono,
              imagen: kImagenNegra[2],
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width / 4.12,
            child: TeclaNegra(
              nota: 9,
              notaTono: notaTono,
              imagen: kImagenNegra[3],
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.height / 6.06,
            child: TeclaNegra(
              nota: 11,
              notaTono: notaTono,
              imagen: kImagenNegra[4],
            ),
          ),
        ],
      ),
    );
  }
}
