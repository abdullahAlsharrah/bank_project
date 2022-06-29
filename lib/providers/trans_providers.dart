import 'dart:convert';
import 'dart:io';

import 'package:bank_project/models/transaction.dart';
import 'package:bank_project/services/trans_services.dart';
import 'package:flutter/material.dart';

class TransProviders extends ChangeNotifier {
  List<Transaction> transactions = [];

  Future<List> getTransactions() async {
    transactions = (await TranServices().getTransactions())!;
    return transactions;
    // notifyListeners();
  }
}
