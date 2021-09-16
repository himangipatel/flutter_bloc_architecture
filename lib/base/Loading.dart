import 'package:flutter/cupertino.dart';

class Loader extends ChangeNotifier{
  bool loading = false;

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }
}