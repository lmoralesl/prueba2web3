import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:prueba2movil3/screens/LoginScreen.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Registro());
}

class Registro extends StatelessWidget {
  const Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
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
        title: const Text("Registro"),
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
              image: AssetImage('assets/images/fondo03.jpg'),
              fit: BoxFit.cover)),

    padding: EdgeInsets.all(10),
    
    child: (
     Column(
       children: <Widget>[
        Text("Registro", style: TextStyle(fontSize: 20),),
        SizedBox(height: 30.0),
        CampoCorreo(context),
        SizedBox(height: 20.0),
        CampoNickName(context),
        SizedBox(height: 20.0),
        CampoContrasenia(context),
         SizedBox(height: 30.0),
        ButonLogin(context)
       ],
     )
    ),
  );
}

final TextEditingController _correo = TextEditingController();
final TextEditingController _nickName = TextEditingController();
final TextEditingController _contrasenia = TextEditingController();


Widget CampoCorreo(context){
return(
 TextField(
    controller: _correo,
      decoration: InputDecoration(
        hintText: "Ingrese correo"),)
);
}
Widget CampoNickName(context){
return(
 TextField(
    controller: _nickName,
      decoration: InputDecoration(
        hintText: "Ingrese NickName"),)
);
}

Widget CampoContrasenia(context){
return(
 TextField(
    controller: _contrasenia,
    obscureText: true,
      decoration: InputDecoration(
        hintText: "Ingrese contraseña"),)
);
}

Widget ButonLogin(context){
  return(
    ElevatedButton(onPressed: (){
       registro(context);
    }, child: Text("Registro"))
  );
}

void registro (context) async{
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _correo.text,
    password: _contrasenia.text,
  );

  //////////////////////////////////////////////////////////
     Navigator.push(context, 
      MaterialPageRoute(builder: (context)=>Login()));
      guardar();

    //////////////////////////////////////////////////////////
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
    alerta01(context);
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
    alerta02(context);
  }
} catch (e) {
  print(e);
  alerta03(context);
}
}

Future<void> guardar() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("usuarios/"+_nickName.text);               //doy el nombre a la coleccion en el metodo .ref y el nombre del id con el que se va a guardar

await ref.set({
  "nickname": _nickName.text,
  "correo": _correo.text
});
}



void alerta01(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Error"),
        content: const Text("La contraseña es muy debil"),
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
        content: const Text("La cuenta ya existe con este correo"),
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
        content: const Text("Contacte con soporte tecnico"),
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