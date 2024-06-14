import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CuentaScreen extends StatefulWidget {
  const CuentaScreen({super.key});

  @override
  _CuentaScreenState createState() => _CuentaScreenState();
}

class _CuentaScreenState extends State<CuentaScreen> {
  String? userNickname;
  DocumentSnapshot? userDocument;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String nickname = user.displayName ?? 'default_nickname';
        DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(nickname)
            .get();
        setState(() {
          userNickname = nickname;
          userDocument = doc;
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userDocument == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cuenta'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuenta'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo04.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/user_image.png'),
            ),
            const SizedBox(height: 20),
            Text(
              'Número de cuenta: ${userDocument!['nickname']}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Valor total de la cuenta: \$${userDocument!['total_value']}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

