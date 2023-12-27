import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import 'profile_tabs/profile_tabs.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  void initState() {
    super.initState();
    var pro = Provider.of<ProfileProvider>(context, listen: false);
    pro.getProfiles();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 5.00, vertical: 10.00),
            child: TabBar(
              tabs: const [
                Tab(icon: Text("Basic Profile")),
                Tab(icon: Text("Friends and Family Profile")),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicator: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(5.00)),
            ),
          ),
          const Expanded(
            child: TabBarView(children: [
              BasicProfile(),
              FriendsAndFamily(),
            ]),
          ),
        ],
      ),
    );
  }
}
