import 'package:flutter/material.dart';

class CartaReusable extends StatelessWidget {
  final Color color;
  final String texto;
  final Function presionado;

  CartaReusable(
      {@required this.color, @required this.texto, @required this.presionado});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: presionado,
        child: Container(
          margin: EdgeInsets.all(1.0),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: Color(0xff70416d),
              width: 1.7,
            ),
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Center(
            child: Text(
              texto,
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF170a19),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
