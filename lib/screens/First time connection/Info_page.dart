import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  String selectedCurrency = "€";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Introduction"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                    child: TextField( decoration:
                    InputDecoration(
                      hintText: "Enter your username",
                      border: OutlineInputBorder(),
                    ),
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
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                      hintText: "Enter age",
                      border: OutlineInputBorder(),
                    ),
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
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        hintText: "Enter Monthly Income",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 80,
                    child: DropdownButtonFormField<String>(
                      value: selectedCurrency,
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
              Row(
                children: [
                  const Text( "Bonuses",
                  style: TextStyle(fontSize : 18),
                  ),
                  const SizedBox(width: 50),
                  SizedBox( width: 500,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        hintText: "Enter Bonuses",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 80,
                    child: DropdownButtonFormField<String>(
                      value: selectedCurrency,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}