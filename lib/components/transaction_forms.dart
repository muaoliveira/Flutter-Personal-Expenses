import 'package:flutter/material.dart';

class TransactionForms extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForms(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextField(
            //onChanged: (newValue) => value = newValue,
            controller: valueController,
            decoration: InputDecoration(
              labelText: 'Valor R\$',
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 119, 21, 136),
            ),
            onPressed: (){
              final title = titleController.text;
              final value = double.tryParse(valueController.text) ?? 0.0;
              onSubmit(title, value);
            },
            child: Text('Nova despesa'),
          ),
        ]),
      ),
    );
  }
}
