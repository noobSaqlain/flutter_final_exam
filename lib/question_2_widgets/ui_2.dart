import 'package:flutter/material.dart';

class ui2 extends StatelessWidget {
  const ui2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Weekly Expense UI'),
          backgroundColor: Colors.teal,
        ),
        body: const WeeklyExpenseUI(),
      ),
    );
  }
}

class WeeklyExpenseUI extends StatelessWidget {
  const WeeklyExpenseUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Weekly Expense",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "From 1 - 6 Apr, 2024",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade300,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("View Report"),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: SizedBox(
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.purple.shade100,
                      child: const Text(
                        "48%",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.green.shade100,
                      child: const Text(
                        "32%",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 30,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.red.shade100,
                      child: const Text(
                        "13%",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.orange.shade100,
                      child: const Text(
                        "7%",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          _buildExpenseRow("Grocery", "\$758.20", Colors.purple),
          _buildExpenseRow("Food & Drink", "\$758.20", Colors.green),
          _buildExpenseRow("Shopping", "\$758.20", Colors.red),
          _buildExpenseRow("Transportation", "\$758.20", Colors.orange),
        ],
      ),
    );
  }

  Widget _buildExpenseRow(String category, String amount, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: color,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              category,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Text(
            amount,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
