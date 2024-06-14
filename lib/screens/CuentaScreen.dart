import 'package:flutter/material.dart';
class Cuenta extends StatelessWidget {
  const Cuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Cuenta",
      home:Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Cuerpo(),
      
    );
  }
}
 
 Widget Cuerpo (){
  return Center(
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('prueba2movil3/assets/images/fondo04.jpg'),
                  
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://st3.depositphotos.com/3776273/31936/i/600/depositphotos_319362956-stock-photo-man-pointing-showing-copy-space.jpg'), 
          ),
          const SizedBox(height: 20),
          const Text(
            'Número de Cuenta: 1234567890',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          const Text(
            'Valor Total de la Cuenta: \$1000.00',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
 }