import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:sary_project/hiveModel/item.dart';
import 'package:sary_project/hiveModel/transaction.dart';

import 'package:sary_project/utils/decoration.dart';

import 'package:sary_project/utils/fontsTheme.dart';

import '../boxes.dart';

import 'buildCancelButton.dart';

import 'package:intl/intl.dart';

class TransactionDialog extends StatefulWidget {
  final Transaction? transaction;
  final String? typeFromButton;

  final Function(String type, String itemId, String quantity, String inboundAt,
      String outboundAt) onClickedDone;

  TransactionDialog({
    Key? key,
    this.transaction,
    this.typeFromButton,
    required this.name,
    required this.onClickedDone,
  }) : super(key: key);

  final String name;
  @override
  _TransactionDialogState createState() => _TransactionDialogState();
}

class _TransactionDialogState extends State<TransactionDialog> {
  final formKey = GlobalKey<FormState>();

  final quantityController = TextEditingController();

  late String selectedItem;
  late int itemId;
  String formattedDate = "";
  late bool getSelected;

  @override
  void initState() {
    itemId = 0;
    formattedDate;
    selectedItem = widget.name;
    getSelected = false;
    print("selectedItem$selectedItem");

    super.initState();
  }

  @override
  void dispose() {
    quantityController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.transaction != null;

    DateTime now = DateTime.now();
    formattedDate = DateFormat('yyy-mm-d').format(now);
    return AlertDialog(
      title: Text(widget.typeFromButton == "inbound"
          ? "Add in-bound transaction"
          : "Add out-bound transaction"),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 8),
              Text(formattedDate),
              SizedBox(height: 8),
              buildQuantity(),
              SizedBox(height: 8),
              ValueListenableBuilder<Box<Item>>(
                valueListenable: Boxes.getItems().listenable(),
                builder: (context, box, _) {
                  final items = box.values.toList().cast<Item>();

                  return buildContent(items);
                },
              ),
              getSelected
                  ? Text("")
                  : Text("required Field", style: FontsTheme.xsmallRed),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        buildCancelButton(context),
        buildAddButton(
          context,
          isEditing: isEditing,
          itemId: itemId,
          formattedDate: formattedDate,
        ),
      ],
    );
  }

  Widget buildQuantity() => TextFormField(
        decoration: ProjectDecorations.buildInputDecoration10radius("Quantity"),
        keyboardType: TextInputType.number,
        validator: (amount) => amount != null && double.tryParse(amount) == null
            ? 'Enter a valid number'
            : null,
        controller: quantityController,
      );

  Widget buildAddButton(
    BuildContext context, {
    required bool isEditing,
    required int itemId,
    required String formattedDate,
  }) {
    final text = isEditing ? 'Save' : 'Add';

    return TextButton(
      child: Text(text),
      onPressed: () async {
        final isValid = formKey.currentState!.validate();
        print(getSelected);
        if (isValid & getSelected) {
          print(getSelected);
          final type = widget.typeFromButton!;
          final itemId = this.itemId.toString();
          print(itemId);
          final quantity = quantityController.text;
          final inboundAt =
              widget.typeFromButton == "inbound" ? formattedDate : "N/A";
          print(formattedDate);
          final outboundAt =
              widget.typeFromButton == "inbound" ? "N/A" : formattedDate;

          widget.onClickedDone(type, itemId, quantity, inboundAt, outboundAt);

          Navigator.of(context).pop();
        }
      },
    );
  }

  Widget buildContent(List<Item> items) {
    String? name = selectedItem;
    print(name);
    return DropdownButton<String>(
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        setState(() {
          name = value;
        });
      },
      value: name,
      items: items.map<DropdownMenuItem<String>>((Item value) {
        return DropdownMenuItem<String>(
          onTap: () {
            setState(() {
              itemId = value.key;
              getSelected = true;

              print(itemId);
            });
          },
          value: value.name,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
}
