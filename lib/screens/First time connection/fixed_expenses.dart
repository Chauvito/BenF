import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'flexible_expenses.dart';

class FixedExpenses extends StatefulWidget {
  final int monthlyIncome;

  const FixedExpenses({super.key,
  required this.monthlyIncome,
  });

  @override
  State<FixedExpenses> createState() => _FixedPageState();
}

class _FixedPageState extends State<FixedExpenses> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController rentController = TextEditingController();
  final TextEditingController insuranceController = TextEditingController();
  final TextEditingController ewgController = TextEditingController();
  final TextEditingController internetController = TextEditingController();
  final TextEditingController educationController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fixed monthly expenses"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text("Please enter the monthly fixed expenses, if you don't have this expenses or isn't monthly enter 0."),
                Row(
                  children: [
                    const Text(
                      "Mortgage/Rent",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 50),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        controller: rentController,
                        decoration: const InputDecoration(
                          hintText: "Enter the cost",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter the cost";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "Insurances(Health,Dental,Car)",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 50),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        controller: insuranceController,
                        decoration: const InputDecoration(
                          hintText: "Enter the insurance cost",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter a value";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "Electricity/Water/Gas",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 50),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        controller: ewgController,
                        decoration: const InputDecoration(
                          hintText: "Enter an estimate cost",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter an estimate or 0";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "Cellphone/Internet",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 50),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        controller: internetController,
                        decoration: const InputDecoration(
                          hintText: "Enter the cost",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter a value";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "School/University Cost",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 50),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        controller: educationController,
                        decoration: const InputDecoration(
                          hintText: "Enter the monthly fee or divide the annual fee by 12",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter the monthly fee or 0";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    int totalFixExpenses = int.parse(rentController.text) + int.parse(insuranceController.text) + int.parse(ewgController.text) + int.parse(internetController.text) + int.parse(educationController.text);
                    int moneyLeft = widget.monthlyIncome-totalFixExpenses;
                    if (_formKey.currentState!.validate() ||  moneyLeft > 0) {
                      //Every field  is filled then pass to next page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlexibleExpenses(
                            totalMoneyLeft: moneyLeft,
                          ),
                        ),
                      );
                    }
                    else if(widget.monthlyIncome - totalFixExpenses <= 0)
                      {
                        "Please check again, your total fix expenses is higher or equal to your monthly income";
                      }
                  },
                  child: const Text("Next"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}