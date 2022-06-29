import 'package:bank_project/models/transaction.dart';
import 'package:bank_project/providers/trans_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RecentTransactions extends StatefulWidget {
  final list;
  var filter;
  RecentTransactions({Key? key, required this.list, required this.filter})
      : super(key: key);

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<TransProviders>().getTransactions(),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<TransProviders>(builder: (context, trans, child) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      widget.list != "all" ? list().length + 1 : list().length,
                  itemBuilder: ((context, index) => index == 0 &&
                          widget.list != "all"
                      ? Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, top: 20.0, bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Recent Transaction",
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: TextButton(
                                  onPressed: () {
                                    context.push("/transactions");
                                  },
                                  child: const Text(
                                    "See all",
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ),
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
                                    "${list()[widget.list != "all" ? index - 1 : index].receiverId}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top: 3.0),
                                  //   child: Text(
                                  //     list()[widget.list != "all"?index-1:index].date,
                                  //     style: const TextStyle(
                                  //         fontSize: 10, color: Colors.grey),
                                  //   ),
                                  // )
                                ],
                              ),
                              SizedBox(
                                width: 65,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${list()[widget.list != "all" ? index - 1 : index].amount} KWD",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "${list()[widget.list != "all" ? index - 1 : index].type}",
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )));
            });
          }
        });
  }

  List<Transaction> list() {
    if (widget.filter != "all") {
      List<Transaction> filteredList = context
          .watch<TransProviders>()
          .transactions
          .where((element) => element.type == widget.filter)
          .toList();

      return filteredList;
    } else {
      List<Transaction> transations =
          context.watch<TransProviders>().transactions;
      return transations;
    }
  }
}
