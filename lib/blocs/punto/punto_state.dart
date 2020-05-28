import 'package:equatable/equatable.dart';
import 'package:pelota_app/models/models.dart';


abstract class PuntoState extends Equatable {
  const PuntoState();

  @override
  List<Object> get props => [];
}

class PuntoAnimado extends PuntoState {

  final Punto punto;  

  const PuntoAnimado({
    this.punto
  });

  @override
  List<Object> get props => [punto];

  @override
  String toString() =>
      'Punto Animado x: ${ punto.x }, y: ${ punto.y }, iteracion: ${ punto.iteracion }';
}