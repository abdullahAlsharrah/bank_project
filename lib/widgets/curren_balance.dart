import 'package:flutter/material.dart';

class CurrenBalance extends StatelessWidget {
  const CurrenBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
          width: 340,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Colors.black,

            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 196, 196, 196),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(2.0, 3.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Current Balance",
                      style: TextStyle(
                          color: Color.fromARGB(255, 197, 197, 197),
                          fontSize: 12),
                    ),
                    const Text(
                      "KWD 4,560,200",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20),
                    )
                  ],
                ),
                Icon(
                  Icons.add,
                  color: Colors.white,
                )
              ],
            ),
          )),
    );
  }
}
