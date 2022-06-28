import 'package:bank_project/providers/auth_providers.dart';
import 'package:bank_project/widgets/actions.dart';
import 'package:bank_project/widgets/curren_balance.dart';
import 'package:bank_project/widgets/drawer.dart';
import 'package:bank_project/widgets/recent_transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!context.read<AuthProviders>().isAuth) {
        context.push("/signin");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _sKey = GlobalKey();
    return Consumer<AuthProviders>(builder: (context, auth, child) {
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
                                auth.user?.username ?? "sss",
                                style: const TextStyle(fontSize: 13),
                              ),
                              const Text(
                                "Welcome Back!",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                      const Icon(Icons.notifications_none)
                    ],
                  ),
                  CurrenBalance(),
                  ActionButtons(),
                  RecentTransactions()
                ],
              ),
            )),
          ));
    });
  }
}
