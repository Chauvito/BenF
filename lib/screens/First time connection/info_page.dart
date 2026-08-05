import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  String selectedCurrency = "€";
  final _formKey = GlobalKey<FormState>();

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
                  SizedBox( width: 500,
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
                  SizedBox( width: 500,
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
                  SizedBox( width: 500,
                    child: TextFormField(
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
                  SizedBox( width: 500,
                    child: TextFormField(
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
                      //Every field  is filled then pass to next page
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