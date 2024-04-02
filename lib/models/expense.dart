
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