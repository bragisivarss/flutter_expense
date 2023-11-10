import 'package:expense/chart/chart.dart';
import 'package:expense/widgets/expenses_list/expenses_list.dart';
import 'package:expense/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense/models/expense.dart';
import 'package:google_fonts/google_fonts.dart';


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
      title: 'Flutter',
      amount: 10.10,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 10.10,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _addExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense){
    setState(() {
    _registeredExpenses.add(expense);
      
    });
  }

  void _removeExpense(Expense expense){
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
          label: 'Undo',
        ),
        ),
        );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('No expenses registered, please add some!',
      style: GoogleFonts.aBeeZee(
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
    ),
    );

    if(_registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
              expenses: _registeredExpenses, 
              onRemoveExpense: _removeExpense
            );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Tracker!',
          style: GoogleFonts.alef(
            fontWeight: FontWeight.bold
          ),
        ),
        shadowColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: _addExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent 
          ),
        ],
      ),
    );
  }
}
