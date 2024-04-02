import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
  
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'flutter course', 
      amount: 19.9, 
      date: DateTime.now(), 
      category: Category.work,
      ),
      Expense(
      title: 'cinema', 
      amount: 15.69, 
      date: DateTime.now(), 
      category: Category.leisure,
      ),
  ];
  
  void _openAddExpenseOverlay(){
    showModalBottomSheet(context: context,
    builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('flutter expensetracker'),
        actions: [
        IconButton(
          onPressed: _openAddExpenseOverlay,
          icon:const Icon(Icons.add))
      ],),
      body: Column(
      children:  [
        const Text('the chart'),
        Expanded(child: ExpensesList(expenses: _registeredExpenses)) 
      ],
    ),);
  }
}
