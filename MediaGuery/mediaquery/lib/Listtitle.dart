import 'package:flutter/material.dart';

class Listtitle extends StatelessWidget {
  const Listtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ejemplo de Listtile'),
        ),
        body: ListView(
          children: const[
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Informaticonfig'),
              subtitle: Text('Canal de Youtube'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Correo'),
                subtitle: Text('Informatigconfig@gmial.com'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
             ],
        ),
        ),
      );
  }
}