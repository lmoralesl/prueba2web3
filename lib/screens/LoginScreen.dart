import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba2movil3/screens/CuentaScreen.dart';
import 'package:prueba2movil3/screens/RegistroScreen.dart';
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
    width: double.infinity,
       decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/fondo02.jpeg'),
              fit: BoxFit.cover)),

    padding: EdgeInsets.all(10),
    child: (
      Column(
        children: <Widget>[
          Text("LOGIN"),
          CampoCorreo(context),
          CampoContrasenia(context),
          BotonLogin(context),
          BotonRegistro(context)
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
        (context)=> CuentaScreen()
        )
        );


/////////////////////////////////////////////////////////    
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
    alerta01(context);
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
    alerta02(context);
  }else{
    alerta03(context);
  }
}
}
Widget BotonRegistro(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.amber,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Registro()),
      );
    },
    child: const Text("Ir a Registro"),
  );
}


void alerta01(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Error"),
        content: const Text("El usuario no existe"),
        actions: [
          
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}

void alerta02(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Error"),
        content: const Text("LLa contraseña es incorrecta"),
        actions: [
          
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}

void alerta03(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Error"),
        content: const Text("Las credenciales ingresadas son incorrectas"),
        actions: [
          
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
