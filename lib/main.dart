// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:expenses/components/transaction_user.dart';

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
  //String value = "";

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
            TransactionUser()
          ],
        ));
  }
}
