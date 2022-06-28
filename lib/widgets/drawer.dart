import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text("Sign in"),
          onTap: () {
            context.push("/signin");
          },
        ),
        ListTile(
          title: Text("Profile"),
        ),
        Divider(),
        ListTile(
          title: Text("Transactions"),
        ),
        Divider(),
        ListTile(
          title: Text("Actions"),
        ),
        Divider(),
        ListTile(
          title: Text("Logout"),
        ),
      ],
    );
  }
}
