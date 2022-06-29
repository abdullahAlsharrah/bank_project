import 'package:bank_project/widgets/recent_transactions.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  String filter = "deposit";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transactions"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    filter = "withdraw";
                  });
                },
                child: const Text("Withdraw")),
            RecentTransactions(list: "all", filter: filter),
          ],
        ),
      ),
    );
  }
}
