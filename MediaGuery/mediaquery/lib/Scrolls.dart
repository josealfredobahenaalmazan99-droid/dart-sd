import 'package:flutter/material.dart';


class ClaseScroll extends StatelessWidget {
  const ClaseScroll({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> libros = [
      {'titulo': 'Cien años de soledad', 'autor': 'Gabriel García Márquez'},
      {'titulo': 'Don Quijote de la Mancha', 'autor': 'Miguel de Cervantes'},
      {'titulo': 'El principito', 'autor': 'Antoine de Saint-Exupéry'},
      {'titulo': '1984', 'autor': 'George Orwell'},
      {'titulo': 'La sombra del viento', 'autor': 'Carlos Ruiz Zafón'},
      {'titulo': 'Rayuela', 'autor': 'Julio Cortázar'},
      {'titulo': 'Crimen y castigo', 'autor': 'Fiódor Dostoyevski'},
      {'titulo': 'Orgullo y prejuicio', 'autor': 'Jane Austen'},
      {'titulo': 'Los juegos del hambre', 'autor': 'Suzanne Collins'},
      {'titulo': 'Harry Potter y la piedra filosofal', 'autor': 'J.K. Rowling'},
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Libreria El cielo de los libros'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: const [
                        Icon(Icons.campaign, color: Colors.deepPurple),
                        SizedBox(width: 8),
                        Text('Informacion Importante',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                        ),
                        ),
                      ],
                      ),
                      const SizedBox(height: 8),
                      const Text('''Tenemos grandes noticias!.
Pronto podras comprar todos tus libros directamente desde nuestra aplicacion. 
 mantente atento a nuestra proxima actualizacion.'''
                     ),
                    ],
                  ),
                  ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: libros.length,
                    itemBuilder: (context, index){
                      final libro = libros[index];
                      return ListTile(
                        leading: const Icon(Icons.book, color: Colors.blueAccent),
                        title: Text(libro['titulo'] ?? 'Sin título'),
                        subtitle: Text(libro['autor'] ?? 'Autor desconocido'),
                      );
                    },
                  ),
                ),
              ),

              Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                child: SizedBox(
                  height: 250,
                  child:  GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: List.generate(
                      9,
                      (index)=>Container(
                        color: Colors.primaries[index % Colors.primaries.length],
                        child: const Center(
                          child: Text('Imagen del libro ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        ),
                        ),
                      ),
                  ),
              ),
              ),
              const Text(
                'Desplazate hacia arriba o abajo para ver todo el contenido .',
                textAlign: TextAlign.center,
                style:  TextStyle(fontStyle: FontStyle.italic),

              )
            ],
          ),
        )
      ),
    );
  }
}