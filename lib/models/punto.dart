import 'package:flutter/material.dart';


class Punto {

  final double x;
  final double y;

  final int iteracion;
  

  const Punto({
    this.x,
    this.y,    
    this.iteracion
  });

  Color get color {

    List<Color> colors = [Colors.purple, Colors.orangeAccent, Colors.pinkAccent, Colors.teal, Colors.blueAccent];

    return colors[ iteracion % colors.length ];

  }

  double get ancho {
    return (iteracion.toDouble() * 20) + 50;
  }

  double get anchoNext {
    return ((iteracion.toDouble() + 1) * 20) + 50;
  }

}
