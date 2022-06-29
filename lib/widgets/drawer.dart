import 'package:bank_project/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProviders>(builder: (context, auth, child) {
      return ListView(
        children: [
          ListTile(
            title: const Text("Edit Profile"),
            onTap: () {
              context.push("/profile");
            },
          ),
          const Divider(),
          const ListTile(
            title: Text("Transactions"),
          ),
          const Divider(),
          const ListTile(
            title: Text("Actions"),
          ),
          const Divider(),
          ListTile(
            title: const Text("Logout"),
            onTap: () {
              auth.logout();
              context.go("/signin");
            },
          ),
        ],
      );
    });
  }
}
