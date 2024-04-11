
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

 // enum is  a keyword that allows us to create a custom type you could say that could be named category here  
  // which simply is combination of predefined allowed values, you define those  allowed values between 
  // opening and closing curly braces,
  enum Category {food, travel, leisure, work}

  const CategoryIcon = {
    Category.food : Icons.lunch_dining,
    Category.travel : Icons.flight_takeoff,
    Category.work : Icons.work,
    Category.leisure : Icons.movie
  };

class Expense{
  
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  } 
}

class ExpenseBucket{
  const ExpenseBucket({
    required this.category,
    required this.expenses
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
   : expenses = allExpenses.where((expense) => expense.category == category).toList();      // adding extra constructor fun to class // alternative to default // it will filter expense from the 
  // whole list and get us expense for some specific category

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses{
  double sum =0;

  for(final expense in expenses)  {
    sum += expense.amount;
  }    // in every iteration a new variable will be picked and will be stored in newly created final variable called expense 
  return sum;

  }
}