import 'package:bascos/models/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensesEntry extends StatefulWidget {
  ExpensesEntry({super.key, required this.addItem});

  Function(ExpensesItem expense) addItem;

  @override
  State<ExpensesEntry> createState() => _ExpensesEntryState();
}

class _ExpensesEntryState extends State<ExpensesEntry> {
  var descController = TextEditingController();
  var amountController = TextEditingController();
  DateTime? selectedDate;

  void showSelectDate() async {
    var date = DateTime.now();
    var result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990, 1, 1),
      lastDate: DateTime(date.year + 1, 12, 31),
    );
    selectedDate = result;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            controller: descController,
            decoration: const InputDecoration(
              label: Text('Description'),
            ),
          ),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Amount'),
              prefix: Text('₱'),
            ),
          ),
          Row(
            children: [
              TextButton.icon(
                onPressed: showSelectDate,
                icon: const Icon(Icons.calendar_month),
                label: Text(
                  selectedDate == null
                      ? 'Date'
                      : DateFormat.yMEd().format(selectedDate!),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.addItem(
                    ExpensesItem(
                        description: descController.text,
                        amount: double.parse(amountController.text),
                        date: selectedDate!),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
