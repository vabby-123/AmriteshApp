import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/modals.dart';
import '../../network/network_service.dart';
import '../../providers/profile_provider.dart';
import '../../styles/text_style.dart';
import '../../widgets/widgets.dart';

class FriendsAndFamily extends StatefulWidget {
  const FriendsAndFamily({Key? key}) : super(key: key);

  @override
  _FriendsAndFamilyState createState() => _FriendsAndFamilyState();
}

class _FriendsAndFamilyState extends State<FriendsAndFamily> {
  final _formKey = GlobalKey<FormState>();

  final _listingKey = const Key("LISTING");
  final _addingKey = const Key("Adding");

  bool isListingShow = true;
  bool _isLoading = false;

  final List<DropdownMenuItem> _genderDropdown = const [
    DropdownMenuItem(
      value: "MALE",
      child: Text("MALE"),
    ),
    DropdownMenuItem(
      value: "FEMALE",
      child: Text("FEMALE"),
    ),
  ];

  final List<DropdownMenuItem> _relationDropdown = const [
    DropdownMenuItem(
      value: 1,
      child: Text("Brother"),
    ),
    DropdownMenuItem(
      value: 2,
      child: Text("Father"),
    ),
    DropdownMenuItem(
      value: 3,
      child: Text("Mother"),
    ),
    DropdownMenuItem(
      value: 4,
      child: Text("Self"),
    ),
    DropdownMenuItem(
      value: 5,
      child: Text("Mother in law"),
    ),
    DropdownMenuItem(
      value: 6,
      child: Text("Father in law"),
    ),
    DropdownMenuItem(
      value: 7,
      child: Text("Sister"),
    ),
  ];

  String _meridian = "AM";
  String _gender = "MALE";
  int _relationId = 1;
  late TextEditingController _nameController;
  late TextEditingController _ddController;
  late TextEditingController _mmmController;
  late TextEditingController _yyyyController;
  late TextEditingController _hhController;
  late TextEditingController _mmController;
  late TextEditingController _placeOfBirthController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _ddController = TextEditingController();
    _mmmController = TextEditingController();
    _yyyyController = TextEditingController();
    _hhController = TextEditingController();
    _mmController = TextEditingController();
    _placeOfBirthController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<ProfileProvider>(context, listen: true).addListener(() {
      var pro = Provider.of<ProfileProvider>(context, listen: false);
      if (pro.isDeleted != null && pro.isDeleted == true) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
              const SnackBar(content: Text("Member Deleted Successfully")));
      } else if (pro.isDeleted != null && pro.isDeleted == false) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(const SnackBar(content: Text("Failed to Delete")));
      }

      if (pro.isSaved != null) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(pro.isSaved!)));
        if (pro.isSaved!.contains("success")) {
          _formKey.currentState!.reset();
          _nameController.clear();
          _ddController.clear();
          _mmmController.clear();
          _yyyyController.clear();
          _hhController.clear();
          _mmController.clear();
          _placeOfBirthController.clear();
          setState(() {
            isListingShow = !isListingShow;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _ddController.dispose();
    _mmmController.dispose();
    _yyyyController.dispose();
    _hhController.dispose();
    _mmController.dispose();
    _placeOfBirthController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Widget listingUi = Column(
      key: _listingKey,
      children: [
        // Wallet & Add money Tile
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade900.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.00),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.account_balance_wallet_rounded,
                    color: Colors.blue.shade900,
                  ),
                ),
                Text(
                  "Wallet Balance: ₹0",
                  style: kTextStyle.copyWith(
                      color: Colors.blue.shade900,
                      fontSize: 16.00,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.blue.shade900),
                          borderRadius: BorderRadius.circular(8.00)),
                      elevation: 0.0),
                  child: Text(
                    "Add Money",
                    style: kTextStyle.copyWith(
                        color: Colors.blue.shade900,
                        fontSize: 14.00,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ),
        // Profile Listing
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.00),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(flex: 1, child: Text("Name", style: kTextStyle)),
              Flexible(flex: 1, child: Text("DOB", style: kTextStyle)),
              Flexible(flex: 1, child: Text("TOB", style: kTextStyle)),
              Flexible(flex: 1, child: Text("Relation", style: kTextStyle)),
              const Spacer(),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Consumer<ProfileProvider>(
              builder: (context, provider, child) {
                if (!provider.isLoading) {
                  List<FamilyProfile> list = provider.profiles;
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return FamilyPersonTile(
                        person: list[index],
                        onEditTap: _onEditTap,
                        onDeleteTap: _onDeleteTap,
                      );
                    },
                  );
                } else {
                  return const Center();
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 10.00),
        // Add new profile Button
        SafeArea(
          child: ElevatedButton.icon(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20.00,
            ),
            onPressed: _onAddPressed,
            label: Text(
              "Add New Profile",
              style: kTextStyle.copyWith(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              primary: theme.primaryColor,
              elevation: 0.0,
            ),
          ),
        ),
        const SizedBox(height: 10.00),
      ],
    );
    Widget addingUi = Column(
      key: _addingKey,
      children: [
        // Back & Title
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              BackButton(
                onPressed: _onAddPressed,
              ),
              Text(
                "Add New Profile",
                style: kTextStyle.copyWith(
                    color: Colors.black54,
                    fontSize: 16.00,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        // Form UI
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Name Text Field
                  MyTextField(
                    title: "Name",
                    controller: _nameController,
                    hintText: null,
                  ),
                  const SizedBox(height: 10.00),
                  // DOB Fields
                  Row(
                    children: [
                      MyTextField(
                        title: "Date Of Birth",
                        controller: _ddController,
                        hintText: "DD",
                        maxLength: 2,
                        textInputType: TextInputType.number,
                      ),
                      const SizedBox(width: 10.00),
                      MyTextField(
                        title: "",
                        controller: _mmmController,
                        hintText: "MM",
                        maxLength: 2,
                        textInputType: TextInputType.number,
                      ),
                      const SizedBox(width: 10.00),
                      MyTextField(
                        title: "",
                        controller: _yyyyController,
                        hintText: "YYYY",
                        maxLength: 4,
                        textInputType: TextInputType.number,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.00),
                  //TOB Fields
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextField(
                        title: "Time Of Birth",
                        controller: _hhController,
                        hintText: "HH",
                        maxLength: 2,
                        textInputType: TextInputType.number,
                      ),
                      const SizedBox(width: 10.00),
                      MyTextField(
                        title: "",
                        controller: _mmController,
                        hintText: "MM",
                        maxLength: 2,
                        textInputType: TextInputType.number,
                      ),
                      const SizedBox(width: 10.00),
                      MeridianSwitcher(
                        isAm: _meridian == "AM",
                        onChange: (value) {
                          setState(() {
                            _meridian = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.00),
                  // Place of Birth
                  MyTextField(
                    title: "Place of Birth",
                    controller: _placeOfBirthController,
                    hintText: null,
                  ),
                  const SizedBox(height: 10.00),
                  Row(
                    children: [
                      MyDropdown(
                        title: "Gender",
                        hintText: "Select",
                        items: _genderDropdown,
                        value: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                      const SizedBox(width: 10.00),
                      MyDropdown(
                        title: "Relation",
                        hintText: "Select",
                        value: _relationId,
                        items: _relationDropdown,
                        onChanged: (value) {
                          setState(() {
                            _relationId = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.00),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.00),
        // Add new profile Button
        SafeArea(
          child: ElevatedButton(
            onPressed: _isLoading ? null : _onSavePressed,
            style: ElevatedButton.styleFrom(
              primary: theme.primaryColor,
              elevation: 0.0,
            ),
            child: Text(
              "Save Changes",
              style: kTextStyle.copyWith(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10.00),
      ],
    );
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: isListingShow ? listingUi : addingUi,
      transitionBuilder: (child, animation) {
        final inAnimation = Tween<Offset>(
                begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
            .animate(animation);
        final outAnimation = Tween<Offset>(
                begin: const Offset(-1.0, 0.0), end: const Offset(0.0, 0.0))
            .animate(animation);

        if (child.key != _listingKey) {
          return SlideTransition(
            position: inAnimation,
            child: child,
          );
        } else {
          return SlideTransition(
            position: outAnimation,
            child: child,
          );
        }
      },
    );
  }

  void _onEditTap(FamilyProfile person) {
    DateTime birth = DateTime.parse(person.dateAndTimeOfBirth!);
    _nameController.text = person.firstName.toString();
    _ddController.text = birth.day.toString();
    _mmmController.text = birth.month.toString();
    _yyyyController.text = birth.year.toString();
    _hhController.text = birth.hour.toString();
    _mmController.text = birth.minute.toString();
    _placeOfBirthController.text = person.birthPlace!.placeName!;
    _gender = person.gender!;
    _relationId = person.relationId!.toInt();
    setState(() {
      isListingShow = !isListingShow;
    });
  }

  void _onDeleteTap(FamilyProfile person) async {
    final bool? confirmation = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Do you really want to Delete?",
              textAlign: TextAlign.center,
            ),
            titleTextStyle: kTextStyle.copyWith(color: Colors.black54),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.00)),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: ElevatedButton.styleFrom(
                  elevation: 1.00,
                  primary: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 40.00),
                ),
                child: Text(
                  "Yes",
                  style: kTextStyle.copyWith(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: ElevatedButton.styleFrom(
                  elevation: 1.00,
                  primary: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 40.00),
                ),
                child: Text(
                  "No",
                  style: kTextStyle.copyWith(color: Colors.white),
                ),
              )
            ],
          );
        });

    if (confirmation != null && confirmation == true) {
      var pro = Provider.of<ProfileProvider>(context, listen: false);
      pro.deleteMember(person.uuid!);
    }
  }

  void _onAddPressed() {
    setState(() {
      isListingShow = !isListingShow;
    });
  }

  void _onSavePressed() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      Map? place;
      final list =
          await NetworkService.getPlaceId(_placeOfBirthController.text);
      if (list.isNotEmpty) {
        place = list.first;
      }

      Map<String, dynamic> body = {
        "birthDetails": {
          "dobDay": _ddController.text,
          "dobMonth": _mmmController.text,
          "dobYear": _yyyyController.text,
          "tobHour": _hhController.text,
          "tobMin": _mmController.text,
          "meridiem": _meridian
        },
        "birthPlace": {
          "placeName": place != null ? place["placeName"] : null,
          "placeId": place != null ? place["placeId"] : null
        },
        "firstName": _nameController.text,
        "lastName": "",
        "relationId": _relationId,
        "gender": _gender
      };

      var pro = Provider.of<ProfileProvider>(context, listen: false);
      pro.saveMember(body);

      setState(() {
        _isLoading = false;
      });
    }
  }
}
