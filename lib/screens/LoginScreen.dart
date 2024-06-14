
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba2movil3/screens/CuentaScreen.dart';
Future<void> main() async {
  
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
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
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context){
  return Container(
    padding: EdgeInsets.all(10),
    child: (
      Column(
        children: <Widget>[
          Text("LOGIN"),
          CampoCorreo(context),
          CampoContrasenia(context),
          BotonLogin(context)
        ],
      )
      
    ),
  );
}
final TextEditingController _correo = TextEditingController();
Widget CampoCorreo(context){
  return Container(
    padding: EdgeInsets.all(10),
    child: (
      TextField(
        controller: _correo,
        decoration: const InputDecoration(
          hintText: "Ingrese Correo"
        ),
      )
    ),
  );
}

final TextEditingController _contrasenia = TextEditingController();
Widget CampoContrasenia(context){
  return Container(
    padding: EdgeInsets.all(10),
    child: (
      TextField(
        controller: _contrasenia,
        decoration: const InputDecoration(
          hintText: "Ingrese Contrasenia"
        ),
      )
    ),
  );
}

Widget BotonLogin(context){
  return(
    FilledButton(onPressed: (){
      login(context);
       
    },
     child: Text("Login"))
  );
}

Future<void> login(context) async {
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _correo.text,password: _contrasenia.text);
/////////////////////////////////////////////////////////
Navigator.push(context, 
        MaterialPageRoute(builder: 
        (context)=> Cuenta()
        )
        );


/////////////////////////////////////////////////////////    
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}

}