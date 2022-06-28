import 'package:flutter/material.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: transactions.length,
        itemBuilder: ((context, index) => index == 0
            ? Padding(
                padding:
                    const EdgeInsets.only(right: 8.0, top: 20.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Recent Transaction",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(fontSize: 11),
                    )
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactions[index].reciever,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(
                            transactions[index].date,
                            style: const TextStyle(
                                fontSize: 10, color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${transactions[index].amount} KWD",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${transactions[index].type}",
                          style:
                              const TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              )));
  }
}

List transactions = [
  Transaction(
      amount: 234,
      reciever: "Ahmad JAsem",
      type: "Deposit",
      date: "20-06-2022"),
  Transaction(
      amount: 234,
      reciever: "Ahmad JAsem",
      type: "Deposit",
      date: "20-06-2022"),
  Transaction(
      amount: 234,
      reciever: "Ahmad JAsem",
      type: "Deposit",
      date: "20-06-2022"),
  Transaction(
      amount: 234,
      reciever: "Ahmad JAsem",
      type: "Deposit",
      date: "20-06-2022"),
  Transaction(
      amount: 234,
      reciever: "Ahmad JAsem",
      type: "Deposit",
      date: "20-06-2022"),
  Transaction(
      amount: 234,
      reciever: "Ahmad JAsem",
      type: "Deposit",
      date: "20-06-2022"),
  Transaction(
      amount: 234,
      reciever: "Ahmad JAsem",
      type: "Deposit",
      date: "20-06-2022"),
  Transaction(
      amount: 234,
      reciever: "Ahmad JAsem",
      type: "Deposit",
      date: "20-06-2022"),
  Transaction(
      amount: 234,
      reciever: "Ahmad JAsem",
      type: "Deposit",
      date: "20-06-2022"),
  Transaction(
      amount: 234,
      reciever: "Ahmad JAsem",
      type: "Deposit",
      date: "20-06-2022"),
  Transaction(
      amount: 234,
      reciever: "Ahmad JAsem",
      type: "Deposit",
      date: "20-06-2022"),
  Transaction(
      amount: 234,
      reciever: "Ahmad JAsem",
      type: "Deposit",
      date: "20-06-2022"),
  Transaction(
      amount: 234,
      reciever: "Ahmad JAsem",
      type: "Deposit",
      date: "20-06-2022"),
  Transaction(
      amount: 234,
      reciever: "Ahmad JAsem",
      type: "Deposit",
      date: "20-06-2022"),
];

class Transaction {
  String date;
  String reciever;
  String type;
  double amount;
  Transaction(
      {required this.amount,
      required this.date,
      required this.type,
      required this.reciever});
}
