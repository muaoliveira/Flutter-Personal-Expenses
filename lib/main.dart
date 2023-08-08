// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
//import 'package:expenses/components/transaction_user.dart';
import './components/transaction_forms.dart';
import './components/transaction_list.dart';
import '../models/transaction.dart';
import 'dart:math';
import 'dart:ui';


main() => runApp(expensesApp());

class expensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    return MaterialApp(
      home: myHomePage(),
      theme:
      tema.copyWith(
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Quicksand',
        ),
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Color.fromARGB(255, 114, 61, 184),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            
          ),
        ),
      ),
    );
  }
}

class myHomePage extends StatefulWidget {
  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  //String value = "";
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

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

   _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForms(_addTransaction);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
          fontFamily: 'OpenSans',
        ),
        centerTitle: true,
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
                child: Card(
                elevation: 5,
                child: Text('Gráfico'),
              )
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
