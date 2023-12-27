import 'package:flutter/material.dart';

import '../styles/text_style.dart';

class MeridianSwitcher extends StatelessWidget {
  final bool isAm;
  final void Function(String value) onChange;
  const MeridianSwitcher({Key? key, required this.isAm, required this.onChange})
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
              "",
              style:
                  kTextStyle.copyWith(color: Colors.black54, fontSize: 15.00),
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(5.00),
            elevation: 1.00,
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: InkWell(
                    onTap: () => onChange("AM"),
                    child: Container(
                      height: kTextTabBarHeight,
                      alignment: Alignment.center,
                      decoration: isAm
                          ? BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(5.00),
                            )
                          : null,
                      child: Text(
                        "AM",
                        style: kTextStyle.copyWith(
                            color: isAm ? Colors.white : Colors.black54),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: InkWell(
                    onTap: () => onChange("PM"),
                    child: Container(
                      height: kTextTabBarHeight,
                      alignment: Alignment.center,
                      decoration: isAm
                          ? null
                          : BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(5.00),
                            ),
                      child: Text(
                        "PM",
                        style: kTextStyle.copyWith(
                            color: !isAm ? Colors.white : Colors.black54),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
