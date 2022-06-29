import 'package:bank_project/widgets/control_balance.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const ContollBalance(
                    method: "send",
                  );
                });
          },
          child: SizedBox(
            width: 100,
            height: 110,
            child: Card(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(61, 255, 255, 255),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Transform.rotate(
                          angle: -0.5,
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Text("Send", style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  String method = "deposit";
                  return ContollBalance(
                    method: method,
                  );
                });
          },
          child: SizedBox(
            width: 100,
            height: 110,
            child: Card(
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(61, 255, 255, 255),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Transform.rotate(
                          angle: 1.55,
                          child: const Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Text("Deposit", style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  String method = "withdraw";
                  return ContollBalance(
                    method: method,
                  );
                });
          },
          child: SizedBox(
            width: 100,
            height: 110,
            child: Card(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(61, 255, 255, 255),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Transform.rotate(
                          angle: -1.55,
                          child: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Text("Withdraw",
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
