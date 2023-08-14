// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
//import 'package:expenses/components/transaction_user.dart';
import './components/transaction_forms.dart';
import './components/transaction_list.dart';
import '../models/transaction.dart';
import './components/chart.dart';
import 'dart:math';
import 'dart:ui';

main() => runApp(expensesApp());

class expensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    return MaterialApp(
      home: myHomePage(),
      theme: tema.copyWith(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Quicksand',
            ),
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Color.fromARGB(255, 114, 61, 184),
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
  final List<Transaction> _transactions = [
    Transaction(
      id: 't0', 
      title: 'Conta antiga', 
      value: 400.01, 
      date: DateTime.now().subtract(Duration(days: 33)),
    ),
    Transaction(
      id: 't1',
      title: 'Novo tênis de corrida',
      value: 350.99,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 223.69,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
  ];

  List<Transaction> get _recentTransactions{
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(
          days: 7
        ),
      ));
    }).toList();
  }
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
          fontFamily: 'OpenSans',
        ),
        centerTitle: true,
        title: const Text('Despesas Pessoais',
            style: TextStyle(
              fontFamily: 'Opensans',
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )),
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
            Chart(_recentTransactions),
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
