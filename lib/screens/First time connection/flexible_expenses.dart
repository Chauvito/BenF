import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlexibleExpenses extends StatefulWidget {
  final int totalMoneyLeft;
  const FlexibleExpenses({super.key,
   required this.totalMoneyLeft,
  });

  @override
  State<FlexibleExpenses> createState() => _FixedPageState();
}

class ExpenseCategory {
  ExpenseCategory({
    required this.name,
    this.amount = 0,
  });

  String name;
  int amount;
}

class _FixedPageState extends State<FlexibleExpenses> {
final _formKey = GlobalKey<FormState>();
late int initialBudget = widget.totalMoneyLeft;
late int remaining = widget.totalMoneyLeft;
final List<ExpenseCategory> expenses = [
  ExpenseCategory(name: "Groceries"),
  ExpenseCategory(name: "Hobbies"),
  ExpenseCategory(name: "Shopping"),
];

@override
void initState() {
  super.initState();

  initialBudget = widget.totalMoneyLeft;
  remaining = initialBudget;
}

void updateRemaining() {
  final totalSpent =
  expenses.fold(0, (sum, expense) => sum + expense.amount);

  setState(() {
    remaining = initialBudget - totalSpent;
  });
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

                      ...expenses.map((expense) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child : Row(
                            children: [
                              SizedBox(
                                width : 150,
                                child: Text(expense.name),
                          ),
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                onChanged: (value) {
                                  expense.amount = int.tryParse(value) ?? 0;
                                  updateRemaining();
                                  },
                              ),
                            ),
                            ],
                          ),
                        );
                      }),
                    //Add button will go here
                    ]
                  ),
                ),
            ),
        ),
    );
  }
}