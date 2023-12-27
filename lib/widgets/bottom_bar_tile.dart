import 'package:flutter/material.dart';

import '../styles/text_style.dart';

class BottomBarTile extends StatelessWidget {
  final String label;
  final String iconPath;
  const BottomBarTile({
    Key? key,
    required this.label,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(iconPath, width: 25.00, height: 25.00),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(label,
              style: kTextStyle.copyWith(
                color: false ? theme.primaryColor : Colors.black54,
                fontSize: 13.00,
              ),
              textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
