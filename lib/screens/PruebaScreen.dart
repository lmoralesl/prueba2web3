import 'package:flutter/material.dart';
import 'LoginScreen.dart';

class PruebaScreen extends StatelessWidget {
  const PruebaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondo01.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Nombre del Estudiante", style: TextStyle(fontSize: 20)),
          Text("Usuario de GitHub", style: TextStyle(fontSize: 20)),
          SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text("Ir a Login"),
          ),
        ],
      ),
    );
  }
}
