import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingLayout extends StatelessWidget {
  const LoadingLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
    child: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: LoadingIndicator(
            colors: [Theme.of(context).colorScheme.primary,Colors.deepOrange],
            indicatorType: Indicator.ballRotate,
          ),
        )),
  );
  }
}