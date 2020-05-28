import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pelota_app/models/punto.dart';
import 'package:pelota_app/blocs/punto/punto.dart';


class PuntoBloc extends Bloc<PuntoEvent, PuntoState> {

  PuntoBloc();

  @override
  get initialState => PuntoAnimado(
    punto: Punto(
      x: 0,
      y: 0,      
      iteracion: 0,
    )
  );

  // Limitamos las emisiones a una por segundo
  @override
  Stream<Transition<PuntoEvent, PuntoState>> transformEvents(
    Stream<PuntoEvent> events,
    TransitionFunction<PuntoEvent, PuntoState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<PuntoState> mapEventToState(PuntoEvent event) async* {

    if (event is PuntoPositioned ) {

      yield PuntoAnimado(
        punto: Punto(
          x: ( event.x - ((state as PuntoAnimado).punto.anchoNext / 2) ),
          y: ( event.y - event.diferencial - ((state as PuntoAnimado).punto.anchoNext / 2) ),
          iteracion: (state as PuntoAnimado).punto.iteracion + 1,
        )
      );

    }

    if (event is PuntoIteracionDecrement ) {

      int iteracion = (state as PuntoAnimado).punto.iteracion;
      int nuevaIteracion = iteracion > 0 ? iteracion - 1 : 0;
      double diferenciaAncho = 10 * ( iteracion.toDouble() - nuevaIteracion);

      yield PuntoAnimado(
        punto: Punto(
          x: (state as PuntoAnimado).punto.x + diferenciaAncho,
          y: (state as PuntoAnimado).punto.y + diferenciaAncho,
          iteracion: nuevaIteracion,
        )
      );

    }
    

  }

}