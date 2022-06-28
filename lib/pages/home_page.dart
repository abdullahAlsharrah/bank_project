import 'package:bank_project/widgets/actions.dart';
import 'package:bank_project/widgets/curren_balance.dart';
import 'package:bank_project/widgets/drawer.dart';
import 'package:bank_project/widgets/recent_transactions.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _sKey = GlobalKey();
    return Scaffold(
      key: _sKey,
      drawer: const Drawer(child: DrawerMenu()),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0, left: 40, right: 40),
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox(
                          width: 50,
                          child: InkWell(
                            onTap: () => {_sKey.currentState?.openDrawer()},
                            child: Image.network(
                                "https://media.istockphoto.com/vectors/user-avatar-profile-icon-black-vector-illustration-vector-id1209654046?s=612x612"),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Abdullah Alsharrah",
                            style: TextStyle(fontSize: 13),
                          ),
                          Text(
                            "Welcome Back!",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.notifications_none)
                ],
              ),
              CurrenBalance(),
              ActionButtons(),
              RecentTransactions()
            ],
          ),
        )),
      ),
    );
  }
}
