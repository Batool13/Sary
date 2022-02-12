import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 1)
class Transaction extends HiveObject {
  //  {
  //     "id": 1,
  //     "type": "inbound",
  //     "itemId": 2,
  //     "quantity": 45,
  //     "inbound_at": "2012-02-27 11:00:00",
  //     "outbound_at": "2012-02-27 13:27:00"
  //   }
  Transaction(
      {required this.id,
      required this.type,
      required this.itemId,
      required this.quantity,
      required this.inbound_at,
      required this.outbound_at});

  @HiveField(0)
  String id;

  @HiveField(1)
  String type;

  @HiveField(2)
  String itemId;

  @HiveField(3)
  String quantity;

  @HiveField(4)
  String inbound_at;

  @HiveField(5)
  String outbound_at;

  // @override
  // String toString() {
  //   return '$id: $price';
  // }

}
