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

  @HiveField(1)
  late String type;

  @HiveField(2)
  late String itemId;

  @HiveField(3)
  late String quantity;

  @HiveField(4)
  late String inboundAt;

  @HiveField(5)
  late String outboundAt;
  Transaction();
  // @override
  // String toString() {
  //   return '$id: $price';
  // }

}
