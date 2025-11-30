import 'package:flutter/material.dart';

class responsivos extends StatelessWidget {
  const responsivos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ejemplo Widget expanded'),
        ),
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.orange,
                height: 100,
                child:  const Center(
                  child: Text('Home',
                  style: TextStyle(
                    fontFamily: 'Verdana',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  ),
                ),
              ),
              ),

              Expanded(
                flex: 2,
              child: Container(
                color: Colors.green,
                height: 100,
                child:  const Center(
                  child: Text('Menu Principal',
                  style: TextStyle(
                    fontFamily: 'Verdana',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  ),
                ),
              ),
              ),

              Expanded(
              child: Container(
                color: Colors.blue,
                height: 100,
                child:  const Center(
                  child: Text('Contacto',
                  style: TextStyle(
                    fontFamily: 'Verdana',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  ),
                ),
              ))
          ],
        ),
        ),
      );
  }
}