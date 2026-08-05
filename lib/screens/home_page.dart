import 'package:flutter/material.dart';

import 'bottom_expenses.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Stat {
  final String name;
  double value;

  Stat(this.name, this.value);
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Stat> stats = [
    Stat("Month", 0.85),
    Stat("Week", 0.65),
    Stat("Groceries", 0.45),
    Stat("Bar", 0.75),
    Stat("Trips", 0.30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Character",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: "Inventory",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [

            // Top title
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "My Character",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            // 3D model placeholder
            Expanded(
              flex: 4,
              child: Stack(
                children: [

                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  const Center(
                    child: Icon(
                      Icons.person,
                      size: 180,
                    ),
                  ),

                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: FloatingActionButton(
                      onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomExpenses(),
                          )
                      );
                      },
                      child: const Icon(Icons.add),
                    ),
                  )
                ],
              ),
            ),

            // Stats
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: stats.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(stats[index].name),
                    subtitle: LinearProgressIndicator(
                      value: stats[index].value,
                      minHeight: 10,
                    ),
                    trailing: Text(
                      "${(stats[index].value * 100).round()}%",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}