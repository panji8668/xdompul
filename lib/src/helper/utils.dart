import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void onWidgetDidBuild(Function callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}

formatAngka(int number) {
  var formatter = NumberFormat("#,###");
  return formatter.format(number).replaceAll(",", ".");
}
