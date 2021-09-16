import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<T,M> extends Bloc<T, M> with ChangeNotifier{
  bool loading = false;

  BaseBloc(M initialState) : super(initialState);

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }
}
