import 'package:expense_tracker/widgets/expense_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        amount: 100,
        title: 'Burger',
        date: DateTime.now(),
        category: Categories.food),
    Expense(
        amount: 200,
        title: 'Travel',
        date: DateTime.now(),
        category: Categories.travel),
    Expense(
        amount: 300,
        title: 'Flutter course',
        date: DateTime.now(),
        category: Categories.bills),
    Expense(
        amount: 400,
        title: 'Entertainment',
        date: DateTime.now(),
        category: Categories.entertainment),
    Expense(
        amount: 500,
        title: 'Others',
        date: DateTime.now(),
        category: Categories.others),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
      ], title: const Text('Expense Tracker')),
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}