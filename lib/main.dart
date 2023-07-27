import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(expensesApp());

class expensesApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: myHomePage(),
    );
  }
}
class myHomePage extends StatelessWidget{
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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Despesas Pessoais'),
        backgroundColor: const Color.fromARGB(255, 119, 21, 136),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          SizedBox(
            child: Card(
              elevation: 5,
              color: Color.fromARGB(255, 119, 21, 136),
              child: Text('Gráfico'),
            )
          ),
          Card(
            child: Text('Lista de Transações'),
          ),
        ],
      )
    );
  }
}