class ExpensesItem {
  ExpensesItem({
    required this.description,
    required this.amount,
    required this.date,
  });

  final String id = DateTime.now().toString();
  final String description;
  final double amount;
  final DateTime date;
}
