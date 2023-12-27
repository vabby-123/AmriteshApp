import 'package:flutter/material.dart';

import '../styles/text_style.dart';

class MyTextField extends StatelessWidget {
  final String title;
  final String? hintText;
  final TextEditingController controller;
  final int? maxLength;
  final TextInputType? textInputType;
  const MyTextField(
      {Key? key,
      required this.title,
      required this.controller,
      required this.hintText,
      this.maxLength,
      this.textInputType})
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
          TextFormField(
            validator: (value) =>
                value.toString().trim().isEmpty ? "Please Enter" : null,
            controller: controller,
            maxLength: maxLength,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: hintText,
                isDense: true,
                isCollapsed: true,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10.00, vertical: 15.00)),
            keyboardType: textInputType,
          )
        ],
      ),
    );
  }
}
