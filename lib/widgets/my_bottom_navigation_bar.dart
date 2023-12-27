import 'package:flutter/material.dart';

import '../constants.dart';
import 'bottom_bar_tile.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final void Function(int index) onTap;
  final Color backgroundColor;
  final int currentIndex;
  const MyBottomNavigationBar(
      {Key? key,
      required this.onTap,
      required this.backgroundColor,
      required this.currentIndex})
      : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  late List<Widget> _items;

  @override
  void initState() {
    super.initState();
    _items = [
      const BottomBarTile(label: "Home", iconPath: icHome),
      const BottomBarTile(label: "Talk", iconPath: icTalk),
      const BottomBarTile(label: "Ask Question", iconPath: icAsk),
      const BottomBarTile(label: "Reports", iconPath: icReports),
      const BottomBarTile(label: "Chat", iconPath: icChat),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
        ),
        padding: const EdgeInsets.all(5.00),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(height: 3.00),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  _items.length,
                  (index) {
                    return Flexible(
                      child: ScaleTransition(
                        scale: widget.currentIndex == index
                            ? const AlwaysStoppedAnimation<double>(1.1)
                            : const AlwaysStoppedAnimation<double>(1.0),
                        child: InkWell(
                          child: _items[index],
                          onTap: () => widget.onTap(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
