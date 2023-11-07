import 'package:bascos/models/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ExpensesListView extends StatelessWidget {
  ExpensesListView({super.key, required this.expensesList});

  List<ExpensesItem> expensesList;
  @override
  Widget build(BuildContext context) {
    var date_formater = DateFormat.yMEd();
    var amount_formater = NumberFormat.currency(symbol: '₱');
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (_, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(expensesList[index].description),
                const Gap(20),
                Row(
                  children: [
                    Text(
                      amount_formater.format(expensesList[index].amount),
                    ),
                    const Spacer(),
                    Text(
                      date_formater.format(expensesList[index].date),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
