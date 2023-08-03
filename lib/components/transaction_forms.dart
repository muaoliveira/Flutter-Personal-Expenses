// ignore_for_file: prefer_const_constructors
//import 'dart:io';
import 'package:flutter/material.dart';

class TransactionForms extends StatefulWidget {

  final void Function(String, double) onSubmit;

  TransactionForms(this.onSubmit);

  @override
  State<TransactionForms> createState() => _TransactionFormsState();
}

class _TransactionFormsState extends State<TransactionForms> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if(title.isEmpty || value <= 0.0) {
      return;
    }

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            controller: titleController,
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextField(
            //onChanged: (newValue) => value = newValue,
            controller: valueController,
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              labelText: 'Valor R\$',
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 119, 21, 136),
            ),
            onPressed: _submitForm,
            child: Text('Nova despesa'),
          ),
        ]),
      ),
    );
  }
}
