// import 'package:flutter/material.dart';
// import 'package:sary_project/hiveModel/item.dart';

// class ItemDialog extends StatefulWidget {
//   final Item? item;
//   final Function(String id, String name, String price, String sku,
//       String description, String image) onClickedDone;

//   const ItemDialog({
//     Key? key,
//     this.item,
//     required this.onClickedDone,
//   }) : super(key: key);

//   @override
//   _ItemDialogState createState() => _ItemDialogState();
// }

// class _ItemDialogState extends State<ItemDialog> {
//   final formKey = GlobalKey<FormState>();
//   final nameController = TextEditingController();
//   final priceController = TextEditingController();
//   final skuController = TextEditingController();
//   final descriptionController = TextEditingController();
//   final imageController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     if (widget.item != null) {
//       final item = widget.item!;

//       nameController.text = item.name;
//       priceController.text = item.price;
//       skuController.text = item.sku;
//       descriptionController.text = item.description;
//       imageController.text = item.image;
//     }
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     priceController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isEditing = widget.item != null;
//     final title = isEditing ? 'Edit Item' : 'Add Item';

//     return AlertDialog(
//       title: Text(title),
//       content: Form(
//         key: formKey,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               SizedBox(height: 8),
//               buildName(),
//               SizedBox(height: 8),
//               buildAmount(),
//               SizedBox(height: 8),

//             ],
//           ),
//         ),
//       ),
//       actions: <Widget>[
//         buildCancelButton(context),
//         buildAddButton(context, isEditing: isEditing),
//       ],
//     );
//   }

//   Widget buildName() => TextFormField(
//         controller: nameController,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           hintText: 'Enter Name',
//         ),
//         validator: (name) =>
//             name != null && name.isEmpty ? 'Enter a name' : null,
//       );

//   Widget buildAmount() => TextFormField(
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           hintText: 'Enter Amount',
//         ),
//         keyboardType: TextInputType.number,
//         validator: (amount) => amount != null && double.tryParse(amount) == null
//             ? 'Enter a valid number'
//             : null,
//         controller: priceController,
//       );

//   Widget buildCancelButton(BuildContext context) => TextButton(
//         child: Text('Cancel'),
//         onPressed: () => Navigator.of(context).pop(),
//       );

//   Widget buildAddButton(BuildContext context, {required bool isEditing}) {
//     final text = isEditing ? 'Save' : 'Add';

//     return TextButton(
//       child: Text(text),
//       onPressed: () async {
//         final isValid = formKey.currentState!.validate();

//         if (isValid) {
//           final name = nameController.text;

//           widget.onClickedDone(name);

//           Navigator.of(context).pop();
//         }
//       },
//     );
//   }
// }
