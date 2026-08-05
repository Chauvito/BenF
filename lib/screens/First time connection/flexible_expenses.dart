import 'package:ben_f/screens/home_page.dart';
import 'package:flutter/material.dart';

class FlexibleExpenses extends StatefulWidget {
  final int totalMoneyLeft;
  const FlexibleExpenses({super.key,
   required this.totalMoneyLeft,
  });

  @override
  State<FlexibleExpenses> createState() => _FixedPageState();
}

class _FixedPageState extends State<FlexibleExpenses> {
final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flexible monthly expenses"),
        ),
        body: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              //Every field  is filled then pass to next page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            }
            },
          child: const Text("Submit"),
        )
    );
  }
}