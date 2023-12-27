import 'package:flutter/material.dart';

import '../models/modals.dart';
import '../network/network_service.dart';

class ProfileProvider extends ChangeNotifier {
  List<FamilyProfile> profiles = [];
  bool isLoading = true;
  bool? isDeleted;
  String? isSaved;

  void getProfiles() async {
    profiles = await NetworkService.getRelativeProfiles();
    isLoading = false;
    notifyListeners();
  }

  void deleteMember(String uuid) async {
    isDeleted = await NetworkService.deleteMember(uuid);
    notifyListeners();
    isDeleted = null;
    notifyListeners();
    getProfiles();
  }

  void saveMember(Map<String, dynamic> body) async {
    isSaved = await NetworkService.saveMember(body);
    notifyListeners();
    isSaved = null;
    notifyListeners();
    getProfiles();
  }
}
