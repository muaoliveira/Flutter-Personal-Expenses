// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_null_comparison
//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForms extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForms(this.onSubmit);

  @override
  State<TransactionForms> createState() => _TransactionFormsState();
}

class _TransactionFormsState extends State<TransactionForms> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _dateSelected = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    final dateSelected = _dateSelected;

    if (title.isEmpty || value <= 0.0 || dateSelected == null) {
      return;
    }

    widget.onSubmit(title, value, dateSelected);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _dateSelected = pickedDate;
        _submitForm();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            controller: _titleController,
            onSubmitted: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextField(
            //onChanged: (newValue) => value = newValue,
            controller: _valueController,
            onSubmitted: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
              labelText: 'Valor R\$',
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Data selecionada: ${_dateSelected == null ? '' : DateFormat('dd/MM/yyyy').format(_dateSelected!)}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: TextButton(
                    onPressed: _showDatePicker,
                    child: Icon(
                      Icons.date_range_sharp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 119, 21, 136),
                  ),
                  onPressed: _submitForm,
                  child: Text('Nova despesa'),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
