import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/modals.dart';
import '../styles/text_style.dart';

class FamilyPersonTile extends StatelessWidget {
  final FamilyProfile person;
  final void Function(FamilyProfile person) onEditTap;
  final void Function(FamilyProfile person) onDeleteTap;
  const FamilyPersonTile(
      {Key? key,
      required this.person,
      required this.onEditTap,
      required this.onDeleteTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.00),
          side: const BorderSide(color: Colors.grey),
        ),
        elevation: 1.00,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Text(
                  person.firstName!,
                  style: kTextStyle,
                ),
              ),
              Flexible(
                flex: 2,
                child: Text(
                  getDate(person.dateAndTimeOfBirth!),
                  style: kTextStyle,
                ),
              ),
              Flexible(
                child: Text(
                  MaterialLocalizations.of(context).formatTimeOfDay(
                      TimeOfDay.fromDateTime(
                          DateTime.parse(person.dateAndTimeOfBirth!)),
                      alwaysUse24HourFormat: true),
                  style: kTextStyle,
                ),
              ),
              Flexible(
                child: Text(
                  person.relation!,
                  style: kTextStyle,
                ),
              ),
              Flexible(
                child: IconButton(
                  onPressed: () => onEditTap(person),
                  icon: Icon(
                    Icons.edit,
                    color: theme.primaryColor,
                  ),
                ),
              ),
              Flexible(
                child: IconButton(
                  onPressed: () => onDeleteTap(person),
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red.shade700,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat.yMd('en_US').format(dateTime);
  }
}
