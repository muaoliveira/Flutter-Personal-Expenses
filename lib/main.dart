// ignore_for_file: prefer_const_constructors

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(expensesApp());

class expensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: myHomePage(),
    );
  }
}

class myHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tênis de corrida',
      value: 350.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 223.69,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Despesas Pessoais'),
          backgroundColor: const Color.fromARGB(255, 119, 21, 136),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
                child: Card(
              elevation: 5,
              color: Color.fromARGB(255, 119, 21, 136),
              child: Text('Gráfico'),
            )),
            Column(
              children: _transactions.map((tr) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: const Color.fromARGB(255, 119, 21, 136),
                        width: 2,
                      )),
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'R\$${tr.value.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 119, 21, 136),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          DateFormat('d MMM y').format(tr.date),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                      ],
                    )
                  ],
                ));
              }).toList(),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Título',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Valor R\$',
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Color.fromARGB(255, 119, 21, 136),
                      ),
                      onPressed: () {},
                      child: Text('Nova despesa'), 
                      ),
                ]),
              ),
            )
          ],
        ));
  }
}
