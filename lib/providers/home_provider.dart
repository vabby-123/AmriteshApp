import 'package:flutter/material.dart';

import '../models/modals.dart';
import '../network/network_service.dart';

class HomeProvider extends ChangeNotifier {
  /// Here we will maintain bottom navigation Bar Index and Initially it will be 0
  int bottomBarIndex = 2;

  bool isCategoriesLoading = true;
  List<QuestionCategory> categories = [];

  /// Here we change the bottom bar Index and Change the UI according to current Bottom bar Index
  void changeIndex(int value) {
    bottomBarIndex = value;
    notifyListeners();
  }

  void getQuestionCategories() async {
    categories = await NetworkService.getQuestions();
    isCategoriesLoading = false;
    notifyListeners();
  }
}
