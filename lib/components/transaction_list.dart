// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  //construtor
  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transaction.isEmpty ? Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            'Nenhuma despesa cadastrada',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            height: 200,
            child: Image.asset('assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ) 
      : ListView.builder(
        itemCount: transaction.length,
        itemBuilder: (ctx, index) {
          final tr = transaction[index];
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
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                )),
                padding: const EdgeInsets.all(15),
                width: 125,
                child: Center(
                  child: Text(
                    'R\$${tr.value.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr.title,
                      style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  Text(
                    DateFormat('d MMM y').format(tr.date),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 65, 65, 65),
                    ),
                  ),
                ],
              )
            ],
          ));
        },
      ),
    );
  }
}
