import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/base/Loading.dart';
import 'package:flutter_bloc_architecture/widget/progress_bar_widget.dart';
import 'package:provider/provider.dart';

abstract class BaseStatelessWidget extends StatelessWidget{

  Loader loader = new Loader();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Loader>(
      create: (context) => loader,
      child: Consumer<Loader>(
        builder: loadingProgressBuilder,
        child: ChildrenHolder(),
      ),
    );
  }

  Widget loadingProgressBuilder(
      BuildContext context, Loader loader, Widget? childrenHolder) {
    return LoadingProgressWidget(
      showIndicator: loader.loading,
      child: statelessWidgetBuilder(context, childrenHolder!),
    );
  }

  Widget statelessWidgetBuilder(BuildContext context, Widget childrenHolder);

}


class ChildrenHolder extends Widget {
  ChildrenHolder();

  @override
  Element createElement() {
    return createElement();
  }
}