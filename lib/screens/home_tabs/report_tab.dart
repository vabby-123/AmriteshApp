import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/widgets.dart';

class ReportTab extends StatelessWidget {
  const ReportTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BottomBarTile(label: "Reports", iconPath: icReports),
    );
  }
}
