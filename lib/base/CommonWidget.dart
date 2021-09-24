import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonWidget extends StatelessWidget{
  final bool loading;

  CommonWidget(this.loading);

  @override
  Widget build(BuildContext context) {
    List<Widget> stackWidgets = [];
    if(loading){
      stackWidgets.add(progressBar(context));
      stackWidgets.add(buildProgressBarContainer(context));
    }
    return Stack(
      alignment: Alignment.center,
      children: stackWidgets,
    );
  }

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
      absorbing: false,
      child: Container(
        color: Colors.black.withAlpha(50),
      ));
}