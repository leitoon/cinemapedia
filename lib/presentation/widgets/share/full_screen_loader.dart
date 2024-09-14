

import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
   FullScreenLoader({super.key});
  
  Stream<String> getLoadingMessages(){
    final messages = <String> [
    'Cargando peliculas',
    'Comprando palomitas de maíz',
    'Llamando a mi novia',
    'Ya mero...',
    'Esto está tardando más de lo esperado :('

  ];
    return Stream.periodic(Duration(milliseconds: 1200), (step){
      return messages[step];

    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Espere por favor'),
          SizedBox(height: 10,),
          CircularProgressIndicator(
            strokeWidth: 2,
          ),
          SizedBox(height: 10,),
          StreamBuilder(stream: getLoadingMessages(),
           builder: (context, snapshot){
            if(!snapshot.hasData) return Text('Cargando...');
            return Text(snapshot.data!);
           })



        ],
      ));
  }
}