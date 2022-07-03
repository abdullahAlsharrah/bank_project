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
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: filter == "all" ? Colors.black : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        filter = "all";
                      });
                    },
                    child: const Text("All")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: filter == "deposit" ? Colors.black : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        filter = "deposit";
                      });
                    },
                    child: const Text("Deposit")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:
                          filter == "withdraw" ? Colors.black : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        filter = "withdraw";
                      });
                    },
                    child: const Text("Withdraw")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:
                          filter == "transfer" ? Colors.black : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        filter = "transfer";
                      });
                    },
                    child: const Text("Transfer")),
              ],
            ),
            RecentTransactions(list: "all", filter: filter),
          ],
        ),
      ),
    );
  }
}
