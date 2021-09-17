import 'package:flutter_bloc_architecture/base/base_bloc.dart';
import 'package:flutter_bloc_architecture/main_bloc/app_loader_event.dart';
import 'package:flutter_bloc_architecture/main_bloc/app_loader_state.dart';

class AppLoaderBloc extends BaseBloc<AppLoaderEvent, AppLoaderState> {
  AppLoaderBloc() : super(Loaded());

  @override
  Stream<AppLoaderState> mapEventToState(AppLoaderEvent event) async* {
    if (event is ShowLoader) {
      yield Loading();
    }
    if (event is HideLoader) {
      yield Loaded();
    }
  }
}
