import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Categories? _selectedCategory;
  DateTime? _selectedDate;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(DateTime.now().year - 1, now.month, now.day);
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = selectedDate;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _amountController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    labelText: 'Amount',
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month),
                        label: Text(
                          _selectedDate == null
                              ? 'No Date Selected'
                              : DateFormat.yMd().format(_selectedDate!),
                        ),
                      )
                    ]),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(children: [
            DropdownButton(
              hint: const Text('Select Category'),
              value: _selectedCategory,
              items: Categories.values
                  .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text(
                        category.name.toUpperCase(),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                //if (_selectedCategory == null) return;
                setState(() {
                  _selectedCategory = value as Categories;
                });
              },
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              label: const Text("Cancel"),
              icon: const Icon(Icons.cancel_outlined),
            ),
            ElevatedButton(
              onPressed: () {
                print(_titleController.text);
                print(_amountController.text);
              },
              child: const Text('Add Expense'),
            ),
          ]),
        ],
      ),
    );
  }
}
