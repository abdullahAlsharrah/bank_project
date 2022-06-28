import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
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
                      color: Color.fromARGB(61, 255, 255, 255),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Transform.rotate(
                        angle: -0.5,
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Text("Send", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
        ),
        SizedBox(
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
                      color: Color.fromARGB(61, 255, 255, 255),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Transform.rotate(
                        angle: 1.55,
                        child: Icon(
                          Icons.login,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Text("Deposit", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
        ),
        SizedBox(
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
                      color: Color.fromARGB(61, 255, 255, 255),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Transform.rotate(
                        angle: -1.55,
                        child: Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Text("Withdraw", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
