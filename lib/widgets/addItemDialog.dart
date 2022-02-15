import 'package:flutter/material.dart';
import 'package:sary_project/hiveModel/item.dart';
import 'package:sary_project/utils/dimens.dart';

import '../provider/itemProvider.dart';
import 'buildCancelButton.dart';
import 'buildTextField.dart';

class ItemDialog extends StatefulWidget {
  final Item? item;
  final Function(String name, String price, String sku, String description,
      String image) onClickedDone;

  const ItemDialog({
    Key? key,
    this.item,
    required this.onClickedDone,
  }) : super(key: key);

  @override
  _ItemDialogState createState() => _ItemDialogState();
}

class _ItemDialogState extends State<ItemDialog> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final skuController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.item != null) {
      final item = widget.item!;

      nameController.text = item.name;
      priceController.text = item.price;
      skuController.text = item.sku;
      descriptionController.text = item.description;
      imageController.text = item.image;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    skuController.dispose();
    descriptionController.dispose();
    imageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.item != null;
    final title = isEditing ? 'Edit Item' : 'Add Item';

    return AlertDialog(
      title: Text(title),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 8),
              BuildTextField(myController: nameController, hint: "Name"),
              SizedBox(height: 8),
              BuildTextField(myController: priceController, hint: "Price"),
              SizedBox(height: 8),
              BuildTextField(myController: skuController, hint: "SKU"),
              SizedBox(height: 8),
              BuildTextField(
                  myController: descriptionController, hint: "Description"),
              SizedBox(height: 8),
              BuildTextField(myController: imageController, hint: "Image"),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        buildCancelButton(context),
        buildAddButton(context, isEditing: isEditing),
      ],
    );
  }

  // Widget buildAmount() => TextFormField(
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(),
  //         hintText: 'Enter Amount',
  //       ),
  //       keyboardType: TextInputType.number,
  //       validator: (amount) => amount != null && double.tryParse(amount) == null
  //           ? 'Enter a valid number'
  //           : null,
  //       controller: priceController,
  //     );

  Widget buildAddButton(BuildContext context, {required bool isEditing}) {
    final text = isEditing ? 'Save' : 'Add';

    return TextButton(
      child: Text(text),
      onPressed: () async {
        final isValid = formKey.currentState!.validate();

        if (isValid) {
          final name = nameController.text;
          final price = priceController.text;
          final sku = skuController.text;
          final description = descriptionController.text;
          final image = imageController.text;

          widget.onClickedDone(name, price, sku, description, image);

          Navigator.of(context).pop();
        }
      },
    );
  }
}
