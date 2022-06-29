import 'package:json_annotation/json_annotation.dart';

part "transaction.g.dart";

@JsonSerializable()
class Transaction {
  int senderId;
  int receiverId;
  int amount;
  String type;

  Transaction({
    required this.senderId,
    required this.receiverId,
    required this.amount,
    required this.type,
  });

  // factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}


//flutter pub run build_runner build
