import 'package:bascos/components/expenses_entry.dart';
import 'package:bascos/components/expenses_list_view.dart';
import 'package:bascos/models/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesListScreen extends StatefulWidget {
  const ExpensesListScreen({super.key});

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  final List<ExpensesItem> _expensesList = [
    ExpensesItem(
      description: 'Upa',
      amount: 5000,
      date: DateTime.now(),
    ),
    ExpensesItem(
      description: 'Gala',
      amount: 10000,
      date: DateTime.now(),
    ),
    ExpensesItem(
      description: 'Pagbuhatan',
      amount: 40,
      date: DateTime.now(),
    ),
    ExpensesItem(
        description: 'Sardinas ken bagas', amount: 50, date: DateTime.now()),
  ];

  void addExpensesItem(ExpensesItem expense) {
    _expensesList.add(expense);
    setState(() {});
  }

  void showItemEntry() {
    showModalBottomSheet(
      context: context,
      builder: (_) => ExpensesEntry(
        addItem: addExpensesItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gastusin"),
        actions: [
          IconButton(
            onPressed: showItemEntry,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ExpensesListView(expensesList: _expensesList),
          ),
        ],
      ),
    );
  }
}
