import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/widgets.dart';

class TalkTab extends StatelessWidget {
  const TalkTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BottomBarTile(label: "Talk", iconPath: icTalk),
    );
  }
}
