import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense>{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime ? _selectedDate;
  Category _selectedCategory = Category.leisure;

void _presentDatePicker () async{
  final now = DateTime.now();
  final firstDate = DateTime(now.year-1, now.month, now.day);
   final pickedDate = await showDatePicker(
    context: context,
    initialDate: now, 
    firstDate: firstDate, 
    lastDate: now
    );
  //print(pickedDate);               // this line will be executed once we get the value in pickedDate since await keyword tells flutter to wait until the value is available
  setState(() {
    _selectedDate =  pickedDate;
  }); 

}

void _submitExpenseData(){
  final enteredAmount =   double.tryParse(_amountController.text); //it converts string to double if it is able to convert or returns null
  if(_titleController.text.trim().isEmpty){
    // show error message 
  }
}

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
           controller: _titleController,
            maxLength: 50,
            decoration:const InputDecoration(
              label: Text('title')
            ),
          ),
          Row(
            children: [
             Expanded(
              child: TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: '₹',
              label: Text('amount'),
            ),
          ),
          ),
          SizedBox(width: 16,),
          Expanded(
            child : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Text(_selectedDate == null?'No date selected' : formatter.format(_selectedDate!)),  // here we use ! to force dart to assume that this will not be null
              IconButton(
                onPressed: _presentDatePicker, 
                icon: const Icon(Icons.calendar_month))
            ],
            )
           
          )
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values.map((category) => DropdownMenuItem(
                  value: category,
                  child: Text(category.name.toUpperCase()))
                 ).toList(),
               onChanged: (value){
                if(value == null){
                  return;
                }
                setState(() {
                  _selectedCategory = value;
                });
               }),
              const Spacer(),
            TextButton(
              onPressed: (){
                Navigator.pop(context); 
              }, 
              child: const Text('Cancel')
            ),
            ElevatedButton(
              onPressed: (){
               print(_titleController.text);
               print(_amountController.text);
              },
            child: const Text('Save Expense'),
            ),
            
          ],
          )
        ],
      ),
      );
  }
}