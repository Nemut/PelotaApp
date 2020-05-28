import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pelota_app/blocs/punto/punto.dart';
import 'package:pelota_app/models/punto.dart';


class HomePage extends StatelessWidget {

  final GlobalKey stickyKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PuntoBloc, PuntoState>(

      builder: (context, state) {

        Punto puntoEstado = (state as PuntoAnimado).punto;
        final size = MediaQuery.of(context).size;
        return Scaffold(
          body: SafeArea(
            child: Stack(
              key: stickyKey,
              children: <Widget>[

                GestureDetector(
                  onTapDown: ( TapDownDetails details) {

                    final keyContext = stickyKey.currentContext;
                    final box = keyContext.findRenderObject() as RenderBox;
                    // Corregimos la diferencia de altura que porvoca el safearea
                    final double diferencial = size.height - box.size.height;
                    // final pos = box.localToGlobal(Offset.zero); //pos.dy + box.size.height,

                    BlocProvider.of<PuntoBloc>(context).add(
                      PuntoPositioned(
                        x: details.globalPosition.dx,
                        y: details.globalPosition.dy,
                        diferencial: diferencial,
                      )
                    );

                  },
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),              

                AnimatedPositioned(
                  duration: Duration( milliseconds: 900),
                  left: puntoEstado.x,
                  top: puntoEstado.y,
                  child: _Rectangulo(
                    ancho: puntoEstado.ancho,
                    iteracion: puntoEstado.iteracion,
                    color: puntoEstado.color
                  ),
                  curve: Curves.bounceOut,
                )
                
              ],
            ),
          ),
        );
      }

    );
    
  }

}



class _Rectangulo extends StatelessWidget {

  final double ancho;
  final int iteracion;
  final Color color;

  const _Rectangulo({ this.ancho, this.iteracion, this.color });

  @override
  Widget build(BuildContext context) {    

    return GestureDetector(
      onTap: () {
        BlocProvider.of<PuntoBloc>(context).add(
          PuntoIteracionDecrement()
        );
      },
      child: AnimatedContainer(
        duration: Duration( milliseconds: 900),
        curve: Curves.bounceOut,
        width: ancho,
        height: ancho,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
        ),
        child: Center(
          child: Text(
            iteracion.toString(),
            style: TextStyle( fontSize: 18, color: Colors.white ),
          )
        )
      ),
    );
  }

}