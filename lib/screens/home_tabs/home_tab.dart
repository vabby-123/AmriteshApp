import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/widgets.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BottomBarTile(label: "Home", iconPath: icHome),
    );
  }
}
