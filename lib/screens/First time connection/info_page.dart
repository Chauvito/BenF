import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'fixed_expenses.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  String selectedCurrency = "€";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController incomeController = TextEditingController();
  final TextEditingController bonusController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Introduction"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
            children: [
              // First row
              Row(
                children: [
                  const Text( "Name",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 50),
                  // Space between text and field const
                  Expanded(
                    child: TextFormField( decoration:
                    InputDecoration(
                      hintText: "Enter your username",
                      border: OutlineInputBorder(),
                    ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty){
                          return "Please enter your username";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Second row
              Row(
                children: [
                  const Text( "Age",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 50),
                  // Space between text and field const
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                      hintText: "Enter age",
                      border: OutlineInputBorder(),
                    ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty){
                          return "Please enter your age";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Third row
              Row(
                children: [
                  const Text( "Monthly income",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 50),
                  // Space between text and field const
                  Expanded(
                    child: TextFormField(
                      controller: incomeController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        hintText: "Enter Monthly Income",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty){
                          return "Please enter your monthly income";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 80,
                    child: DropdownButtonFormField<String>(
                      initialValue: selectedCurrency,
                      decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: "€", child: Text("€")),
                      DropdownMenuItem(value: "\$", child: Text("\$")),
                      DropdownMenuItem(value: "£", child: Text("£")),
                      DropdownMenuItem(value: "¥", child: Text("¥")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedCurrency = value!;
                      });
                    },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              //Fourth Row
              Row(
                children: [
                  const Text( "Bonuses",
                  style: TextStyle(fontSize : 18),
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    child: TextFormField(
                      controller: bonusController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        hintText: "Enter Bonuses",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty){
                          return "Please enter bonuses";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 80,
                    child: DropdownButtonFormField<String>(
                      initialValue: selectedCurrency,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(value: "€", child: Text("€")),
                        DropdownMenuItem(value: "\$", child: Text("\$")),
                        DropdownMenuItem(value: "£", child: Text("£")),
                        DropdownMenuItem(value: "¥", child: Text("¥")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedCurrency = value!;
                        });
                      },
                    ),
                  ),
                ]
              ),
              const SizedBox(height: 20),
              //Button to confirm
              Row(
                children: [
                  ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      int income= int.parse(incomeController.text) + int.parse(bonusController.text);
                      //Every field  is filled then pass to next page
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FixedExpenses(
                                monthlyIncome: income,
                              ),
                          ),
                      );
                    }
                  },
                    child: const Text("Next")
                  )
                ]
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}