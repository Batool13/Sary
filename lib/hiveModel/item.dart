import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 0)
class Item extends HiveObject {
  // {
  //   "id": 2,
  //   "name": "Afia Corn Oil",
  //   "price": "12.13",
  //   "sku": "PRO-SA2",
  //   "description": "6 x 320 ml",
  //   "image": ""
  // }
  Item(
      {required this.id,
      required this.name,
      required this.price,
      required this.sku,
      required this.description,
      required this.image});

  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String price;

  @HiveField(3)
  String sku;

  @HiveField(4)
  String description;

  @HiveField(5)
  String image;

  // @override
  // String toString() {
  //   return '$id: $price';
  // }

}

// void main() async {
//   var path = Directory.current.path;
//   Hive
//     ..init(path)
//     ..registerAdapter(ItemAdapter());

//   var box = await Hive.openBox('testBox');

//   var item = Item(
//       id: "1",
//       name: "oil",
//       price: "99",
//       sku: "sku",
//       description: "Description ",
//       image: "image");

//   await box.put('dave', item);

//   print(box.get('dave')); // Dave: 22
// }
