import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba2movil3/screens/LoginScreen.dart';
import 'package:prueba2movil3/screens/RegistroScreen.dart';
import 'package:prueba2movil3/screens/CuentaScreen.dart';
import 'package:prueba2movil3/screens/HistorialScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Welcome());
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Cuerpo(),
    HistorialScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRUEBA'),
      ),
      body: Container(child: _widgetOptions.elementAt(_selectedIndex)),
      
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
       decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/fondo01.jpeg'),
              fit: BoxFit.cover)),

      child: Center(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Nombre del estudiante: Luis Morales',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'Usuario de GitHub: luirimo@hotmail.com',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            BotonLogin(context),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

Widget BotonLogin(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.amber,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    },
    child: const Text("Ir a Login"),
  );
}
