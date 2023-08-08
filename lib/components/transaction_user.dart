import 'dart:math';
import 'package:flutter/material.dart';
import 'transaction_forms.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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

  _addTransaction(String title, double value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(), 
      title: title, 
      value: value, 
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        TransactionList(_transactions),
        TransactionForms(_addTransaction),
      ],
    );
  }
  
}