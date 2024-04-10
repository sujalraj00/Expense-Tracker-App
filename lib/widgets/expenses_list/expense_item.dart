import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:expense_tracker/models/expense.dart';

class ExpenseItem extends StatelessWidget{
 const ExpenseItem(this.expense, {super.key});
 
 final Expense expense;

  @override
  Widget build(BuildContext context) {
   return Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
          vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(expense.title,
          style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 4,),
          Row(
            children: [
            Text('\₹${expense.amount.toStringAsFixed(2)}'),  // 12.3433 => 12.34  it will limit it to 2 digits after point
            // curly braces tells that it should take this as one value that should be injected into this string
            // here the 2nd $ sign belong to special injection whereas 1st will be output as we are escaping it 
            const Spacer(),
            Row(
              children: [
                Icon(CategoryIcon[expense.category]),
                const SizedBox(width: 8,),
                Text(expense.formattedDate)
              ],
            )
            ],
          )
        ],
      ),
    ),
    );
  }
}