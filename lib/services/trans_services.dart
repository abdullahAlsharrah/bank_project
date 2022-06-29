import 'package:bank_project/models/transaction.dart';
import 'package:bank_project/services/client.dart';
import 'package:bank_project/widgets/recent_transactions.dart';
import 'package:dio/dio.dart';

class TranServices {
  // final _dio = Dio();
  Future<List<Transaction>?> getTransactions() async {
    List<Transaction>? transactions = [];
    try {
      Response res = await Client.dio.get("/transactions");
      transactions = (res.data as List)
          .map((transaction) => Transaction.fromJson(transaction))
          .cast<Transaction>()
          .toList();
    } on DioError catch (error) {
      print("NetWork Error $Error");
    }
    return transactions;
  }
}
