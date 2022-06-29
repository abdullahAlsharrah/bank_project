import 'package:json_annotation/json_annotation.dart';

part "balance.g.dart";

@JsonSerializable()
class Balance {
  int amount;
  Balance(this.amount);

  factory Balance.fromJson2(Map<String, dynamic> json) =>
      _$BalanceFromJson(json);
  Map<String, dynamic> toJson() => _$BalanceToJson(this);
}
