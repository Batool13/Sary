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
  // Item(this.id, this.name, this.price, this.sku, this.description, this.image);

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String price;

  @HiveField(3)
  late String sku;

  @HiveField(4)
  late String description;

  @HiveField(5)
  late String image;

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
