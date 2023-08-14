// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transaction;

  //construtor
  TransactionList(this.transaction);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: widget.transaction.isEmpty
          ? Column(
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
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: widget.transaction.length,
              itemBuilder: (ctx, index) {
                final tr = widget.transaction[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 20,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text('R\$${tr.value}'),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.transaction.removeWhere(
                            (ctx) => ctx.id == tr.id,
                          );
                        });
                      },
                      icon: Icon(Icons.remove_circle_outlined),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
