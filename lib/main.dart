import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pelota_app/screens/screens.dart';
import 'package:pelota_app/blocs/punto/punto.dart';
// import 'package:pelota_app/simple_bloc_delegate.dart';
 
void main() {
  // BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());

}
 
class MyApp extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {    

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Punto Gordo',

      home: BlocProvider(
        create: (context) => PuntoBloc(),
        child: HomePage()
      )
    );

  }
}