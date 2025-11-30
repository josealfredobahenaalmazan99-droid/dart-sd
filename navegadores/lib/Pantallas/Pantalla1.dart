import 'package:flutter/material.dart';
import 'Pantalla2.dart';
class Pantalla1 extends StatelessWidget {
  const Pantalla1({super.key});

  @override
  Widget build(BuildContext context) {

    const String mensaje = "Hola pantalla 1 0=0";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 1'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Ir a pantalla 2'),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> const Pantalla2(
                datorecibido: mensaje,
              ),
              ),
            );
          },
          ),
      ),
    );
  }
}
