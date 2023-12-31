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
          secondary: Colors.amber,
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
    /*Transaction(
      id: 't0', 
      title: 'Conta antiga', 
      value: 400.01, 
      date: DateTime.now().subtract(Duration(days: 33)),
    ),*/
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
  _addTransaction(String title, double value, DateTime dateSelected) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: dateSelected,
    );
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) {
        return tr.id == id;
      });
    });
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
            TransactionList(_transactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 134, 95, 184),
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
