import 'package:ben_f/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlexibleExpenses extends StatefulWidget {
  final int totalMoneyLeft;

  const FlexibleExpenses({super.key,
   required this.totalMoneyLeft,
  });

  @override
  State<FlexibleExpenses> createState() => _FlexibleExpensesState();
}

class Expense {
  Expense.predefined(String name)
      : isCustom = false,
        nameController = TextEditingController(text: name),
        amountController = TextEditingController();

  Expense.custom()
      : isCustom = true,
        nameController = TextEditingController(),
        amountController = TextEditingController();

  final bool isCustom;

  final TextEditingController nameController;
  final TextEditingController amountController;
}

class _FlexibleExpensesState extends State<FlexibleExpenses> {
final _formKey = GlobalKey<FormState>();
late int initialBudget = widget.totalMoneyLeft;
late int remaining = widget.totalMoneyLeft;
final List<Expense> expenses = [];


@override
void initState() {
  super.initState();

  initialBudget = widget.totalMoneyLeft;
  remaining = initialBudget;

  expenses.addAll([
    Expense.predefined("Groceries"),
    Expense.predefined("Hobbies"),
    Expense.predefined("Shopping"),
  ]);
}

void updateRemaining() {
  int totalSpent = 0;

  for (final expense in expenses) {
    totalSpent += int.tryParse(expense.amountController.text) ?? 0;
  }

  setState(() {
    remaining = initialBudget - totalSpent;
  });
}

@override
void dispose() {
  for (final expense in expenses) {
    expense.nameController.dispose();
    expense.amountController.dispose();
  }
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flexible monthly expenses"),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text("Add the ideal max amount you want to spend on each activity"),
                      Text("Tip: The idea is to have better control and understanding on what you are your expenses trends"),
                      Text("So go specific in the activities(gym, online courses, SPA, ...)"),
                      // Progress section
                      const SizedBox(height: 8),

                      Text(
                        "Remaining: €$remaining",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      LinearProgressIndicator(
                        value: remaining / initialBudget,
                        minHeight: 12,
                      ),

                      const SizedBox(height: 30),

                    Expanded(
                        child: ListView.builder(
                        itemCount: expenses.length,
                        itemBuilder: (context,index) {
                          final expense = expenses[index];

                          return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                  children: [

                                    Expanded(
                                      flex: 2,
                                      child: TextFormField(
                                        controller: expense.nameController,
                                        readOnly: !expense.isCustom,
                                        decoration: InputDecoration(
                                          hintText: "Expense",
                                          border: const OutlineInputBorder(),
                                          filled: !expense.isCustom,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 10),

                                    Expanded(child: TextFormField(
                                      controller: expense.amountController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: const InputDecoration(
                                        hintText: "Amount",
                                        border: OutlineInputBorder(),
                                      ),
                                      onChanged: (_) {
                                        updateRemaining();
                                      },
                                    )
                                    )
                                  ]
                              )
                          );
                          },
                        )
                    ),

                    Row(
                      children: [
                        Expanded(child: ElevatedButton.icon(
                            icon: const Icon(Icons.add),
                        label: const Text("Add expense"),
                        onPressed: () {
                              setState(() {
                                expenses.add(Expense.custom());
                              });
                        },
                        ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(child: ElevatedButton(
                          child: const Text("Done"),
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  )
                              );
                            },))
                      ]
                    )

                    //Add button will go here
                    ]
                  ),
                ),
            ),
        ),
    );
  }
}