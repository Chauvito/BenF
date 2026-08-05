import 'package:flutter/material.dart';

class BottomExpenses extends StatefulWidget {
  const BottomExpenses({super.key});

  @override
  State<BottomExpenses> createState() => _BottomExpensesState();
}

class ExpenseItem {
  final TextEditingController expenseController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
}

class _BottomExpensesState extends State<BottomExpenses> {
  final List<ExpenseItem> expenses = [ExpenseItem()];

  @override
  void dispose() {
    for (var expense in expenses) {
      expense.expenseController.dispose();
      expense.amountController.dispose();
    }
    super.dispose();
  }

  void addExpense() {
    setState(() {
      expenses.add(ExpenseItem());
    });
  }

  void removeExpense(int index) {
    if (expenses.length == 1) return;

    expenses[index].expenseController.dispose();
    expenses[index].amountController.dispose();

    setState(() {
      expenses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expenses")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add your expenses",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: expenses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextField(
                                controller:
                                expenses[index].expenseController,
                                decoration: const InputDecoration(
                                  hintText: "Expense",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),

                            const SizedBox(width: 10),

                            SizedBox(
                              width: 90,
                              child: TextField(
                                controller:
                                expenses[index].amountController,
                                keyboardType:
                                const TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                decoration: const InputDecoration(
                                  hintText: "0.00",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),

                            const SizedBox(width: 8),

                            const Text(
                              "€",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => removeExpense(index),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: addExpense,
                  icon: const Icon(Icons.add),
                  label: const Text("Add another expense"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}