import 'package:flutter/material.dart';

class LoadingProgressWidget extends StatelessWidget {
  Widget? child;
  final ValueChanged<bool>? progressListener;
  bool? showIndicator = true;
  final bool? touchEnable;

  LoadingProgressWidget(
      {this.progressListener,
        this.showIndicator,
        this.child,
        this.touchEnable = true});

  @override
  Widget build(BuildContext context) {
    List<Widget> stackWidgets = [];
    stackWidgets.add(child!);
    if (showIndicator!) {
      stackWidgets.add(getBlockingUi(context));
      stackWidgets.add(progressBar(context));
    }

    return Stack(
        alignment: Alignment.center,
        children: stackWidgets);
  }

  Widget progressBar(BuildContext context) {
    return Positioned(
      width: 50,
      height: 50,
      child: buildProgressBarContainer(context),
    );
  }

  Widget buildProgressBarContainer(BuildContext context) {
    return Card(
        shape: CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularProgressIndicator(),
        ));
  }

  Widget getBlockingUi(BuildContext context) {
    return AbsorbPointer(
        absorbing: touchEnable!,
        child: Container(
          color: Colors.black.withAlpha(50),
        ));
  }
}