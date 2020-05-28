import 'package:equatable/equatable.dart';


abstract class PuntoEvent extends Equatable {

  const PuntoEvent();
  
  @override
  List<Object> get props => [];
}

class PuntoPositioned extends PuntoEvent {

  final double x;
  final double y;
  final double diferencial;

  PuntoPositioned({ this.x, this.y, this.diferencial });

  @override
  String toString() => 'PuntoMovido a : $x, $y, $diferencial';
  
}

class PuntoIteracionDecrement extends PuntoEvent {}
