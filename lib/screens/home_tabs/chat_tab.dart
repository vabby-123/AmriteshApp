import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/widgets.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BottomBarTile(label: "Chat", iconPath: icChat),
    );
  }
}
