import 'package:bank_project/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContollBalance extends StatelessWidget {
  final String method;
  const ContollBalance({Key? key, required this.method}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var balance = TextEditingController();
    var username = TextEditingController();
    return AlertDialog(
      content: SizedBox(
        height: method == "send" ? 250 : 200,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Form(
              // key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    method == "deposit"
                        ? "Add Balance"
                        : method == "withdraw"
                            ? "Withdraw"
                            : "Send",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (method == "send")
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: username,
                          decoration:
                              const InputDecoration(hintText: "Reciever")),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: balance,
                        decoration:
                            const InputDecoration(hintText: "0.00 KWD")),
                  ),
                  Consumer<AuthProviders>(builder: (context, auth, child) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text(method == "deposit"
                            ? "Add"
                            : method == "withdraw"
                                ? "Withdraw"
                                : "Send"),
                        onPressed: () async {
                          if (method == "deposit") {
                            await auth.addBalance(balance.text);
                          } else if (method == "withdraw") {
                            if ((auth.user?.balance ?? 0) <
                                int.parse(balance.text)) {
                              final scaffold = ScaffoldMessenger.of(context);
                              scaffold.showSnackBar(
                                SnackBar(
                                  content: const Text(
                                      'Sorry You don\'t have Suffiecient Balance'),
                                  backgroundColor: Colors.red,
                                  action: SnackBarAction(
                                      label: 'Hide',
                                      textColor: Colors.black,
                                      onPressed: scaffold.hideCurrentSnackBar),
                                ),
                              );
                            } else {
                              await auth.withdraw(balance.text);
                            }
                          } else {
                            if ((auth.user?.balance ?? 0) <
                                int.parse(balance.text)) {
                              final scaffold = ScaffoldMessenger.of(context);
                              scaffold.showSnackBar(
                                SnackBar(
                                  content: const Text(
                                      'Sorry You don\'t have Suffiecient Balance'),
                                  backgroundColor: Colors.red,
                                  action: SnackBarAction(
                                      label: 'Hide',
                                      textColor: Colors.black,
                                      onPressed: scaffold.hideCurrentSnackBar),
                                ),
                              );
                            } else {
                              await auth.send(balance.text, username.text);
                            }
                          }
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        },
                      ),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
