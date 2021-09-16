import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/widget/progress_bar_widget.dart';
import 'package:flutter_bloc_architecture/utils/size_config.dart';
import 'package:provider/provider.dart';

import 'base_bloc.dart';


abstract class BaseStateFullWidget<M extends BaseBloc, T extends StatefulWidget>
    extends State<T> {

  late M bloc;
  late SizeConfig sizeConfig;

  @override
  void initState() {
    super.initState();
    print('initState');
    bloc = initBloc();
    sizeConfig =  new SizeConfig();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    sizeConfig.init(context);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<M>(
      create: (context) => bloc,
      child: Consumer<M>(
        builder: loadingProgressBuilder,
        child: ChildrenHolder(),
      ),
    );
  }

  Widget loadingProgressBuilder(
      BuildContext context, M baseModel, Widget? childrenHolder) {
    return LoadingProgressWidget(
      showIndicator: bloc.loading,
      child: stateWidgetBuilder(context, childrenHolder!),
    );
  }

  M initBloc();

  Widget stateWidgetBuilder(BuildContext context, Widget childrenHolder);
}

class ChildrenHolder extends Widget {
  ChildrenHolder();

  @override
  Element createElement() {
    return createElement();
  }
}
