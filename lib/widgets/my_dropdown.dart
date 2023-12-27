import 'package:flutter/material.dart';

import '../styles/text_style.dart';

class MyDropdown extends StatelessWidget {
  final String title;
  final String? hintText;
  final List<DropdownMenuItem> items;
  final void Function(dynamic value) onChanged;
  final dynamic value;
  const MyDropdown(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.items,
      required this.onChanged,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              title,
              style:
                  kTextStyle.copyWith(color: Colors.black54, fontSize: 15.00),
            ),
          ),
          Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.00),
              side: BorderSide(color: Colors.grey.shade400),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: DropdownButton(
                items: items,
                onChanged: onChanged,
                value: value,
                isDense: false,
                underline: const Center(),
                isExpanded: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
