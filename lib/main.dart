import 'package:flutter/material.dart';
import 'setup.dart';

void main() {
  initApplication().then((value) {
    runApp(const MyApp());
  });
}