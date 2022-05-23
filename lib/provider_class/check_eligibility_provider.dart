import 'package:flutter/material.dart';

class CheckEligibility extends ChangeNotifier {
  String _message = "You have not given any input";
  bool _isEligible = false;

  String get message => _message;
  bool get isEligible => _isEligible;

  void checkEligible(int age) {
    if (age >= 18) {
      eligible();
    } else {
      notEligible();
    }
  }

  void eligible() {
    _isEligible = true;
    _message = "Yor are eligible to driving license";
    notifyListeners();
  }

  void notEligible() {
    _isEligible = false;
    _message = "Yor are not eligible to driving license";
    notifyListeners();
  }
}
