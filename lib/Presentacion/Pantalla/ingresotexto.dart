import 'package:flutter/material.dart';
class IngresoTexto extends StatefulWidget {
  const IngresoTexto({super.key});
  @override
  State<IngresoTexto> createState()=> IngresoTextoState();
}
class IngresoTextoState extends State<IngresoTexto>{
  final TextEditingController _controller = TextEditingController();
  final llaveFormulario = GlobalKey<FormState>();

  String textomostrado = '';
  String? opcionSeleccionada;
  bool usuarioactivo = false;

  bool opcion1 = false;
  bool opcion2 = false;
  bool opcion3 = false;

  String? nivelExperiencia;

  final List<String> paises=[
    'Argentina',
    'España',
    'Colombia',
    'Mexico',
    'Peru',
    'Venezuela',
    'Rep Dominicana'
  ];

  void muestraTexto(){
   if (llaveFormulario.currentState!.validate()) {
    setState(() {
      //=====CONCATENACION DE CHECKBOX==0
      List<String> lenguajes = [];
      if (opcion1) lenguajes.add('Dart');
      if (opcion2) lenguajes.add('Java');
      if (opcion3) lenguajes.add('Python');

      textomostrado = '''${_controller.text}\nPais: $opcionSeleccionada\n 
      Usuario activo?: ${usuarioactivo ? 'Activo ': 'Inactivo'}
      Lenguaje Seleccionado: ${lenguajes.isEmpty ? 'Ninguno': lenguajes.join(', ')}''';

    });
  }
  }
  void limpiarTexto(){
    setState(() {
      _controller.clear();
      textomostrado =' ';
      opcionSeleccionada = null;
      usuarioactivo = false;

      opcion1 = false;
      opcion2 = false;
      opcion3 = false;

      

    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Registro de nombre "),),
      body: SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: llaveFormulario,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
//====CAMPO DE TEXTO======
          TextFormField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Ingrese texto...',
              border: OutlineInputBorder()
            ),
            validator: (value){
              if (value == null || value.isEmpty ) {
                return'Porfavor ingrese algun texto';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
//======DROPDOWN===========
DropdownButtonFormField<String>(
  decoration: const InputDecoration(
    labelText: 'Seleccione un pais',
    border: OutlineInputBorder(),
  ),
  initialValue: opcionSeleccionada,
  items: paises.map((opcion){
  return DropdownMenuItem<String>(
    value:  opcion,
    child:  Text(opcion as String),
  );
  }).toList(),
  onChanged: (nuevoValor){
    setState(() {
      opcionSeleccionada = nuevoValor;
    });
  },
  validator:(value){
    if(value == null){
      return 'Seleccionre una opcion';
    }
    return null;
  },
      ),

const SizedBox(height: 30),

//=====SWITCH=====

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              const Text(
                'Usuario activo?',
                style: TextStyle(fontSize: 16),
              ),
              Switch (
                value: usuarioactivo,
                onChanged: (valornuevo){
                  setState(() {
                    usuarioactivo = valornuevo;
                  });
                },
              )
              
            ],
          ),

          const SizedBox(height: 30),

//======RADIOBUTTONS======
          const Text('nivel de experiencia',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          RadioListTile<String>(
            title: const Text('Junior'),
            value: 'Junior',
            // ignore: deprecated_member_use
            groupValue: nivelExperiencia,
            // ignore: deprecated_member_use
            onChanged: (valor){
              setState(() {
                nivelExperiencia = valor;
              });
            },
          ),
           RadioListTile<String>(
            title: const Text('Senior'),
            value: 'Senior',
            // ignore: deprecated_member_use
            groupValue: nivelExperiencia,
            // ignore: deprecated_member_use
            onChanged: (valor){
              setState(() {
                nivelExperiencia = valor;
              });
            },
          ),

          RadioListTile<String>(
            title: const Text('Otro'),
            value: 'Otro',
            // ignore: deprecated_member_use
            groupValue: nivelExperiencia,
            // ignore: deprecated_member_use
            onChanged: (valor){
              setState(() {
                nivelExperiencia = valor;
              });
            },
          ),


          const Text('Selecione lenguaje', 
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
          ),
          
          //======checkbox1==========
          CheckboxListTile(
            title: const Text('Dart'),
            value:  opcion1,
            onChanged: (bool? valornuevo){
              setState(() {
              opcion1 = valornuevo!;
            });
  },
  ),

  //======checkbox2==========
          CheckboxListTile(
            title: const Text('Java'),
            value:  opcion2,
            onChanged: (bool? valornuevo){
              setState(() {
              opcion2 = valornuevo!;
            });
  },
  ),

  //======checkbox3==========
          CheckboxListTile(
            title: const Text('Python'),
            value:  opcion3,
            onChanged: (bool? valornuevo){
              setState(() {
              opcion3 = valornuevo!;
            });
  },
  ),
            
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: muestraTexto, 
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 26, 246, 1)),
              child: const Text('Mostrar'),
              ),
              ElevatedButton(onPressed: limpiarTexto,
              style:  ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 248, 4, 4)),
              child: const Text('Limpiar'),
              ),
            ],
          ),
          const SizedBox(height: 30,),
          Text(
            textomostrado.isEmpty? '''Mostrar: muestra texto
 Limpiar limpia el texto colocado'''
             :'texto ingresado: $textomostrado',
             style: const TextStyle(fontSize: 18),
          )
        ],
      )
      )
    ),
    );
  }
}