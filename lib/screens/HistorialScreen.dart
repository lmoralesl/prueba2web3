import 'package:flutter/material.dart';

class HistorialScreen extends StatelessWidget {
  const HistorialScreen({super.key});

  final List<Map<String, dynamic>> transactions = const [
    {
      'ret': 'Retiro: 30',
      'type': 'Tipo: Impuestos',
      'balance': 'Saldo: 450',
    },
    {
      'ret': 'Retiro: 50',
      'type': 'Tipo: Compras',
      'balance': 'Saldo: 400',
    },
    {
      'ret': 'Retiro: 20',
      'type': 'Tipo: Servicios',
      'balance': 'Saldo: 380',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo05.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: Text(transaction['ret']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transaction['type']),
                    Text(transaction['balance']),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}