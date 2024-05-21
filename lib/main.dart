import 'package:flutter/material.dart';
import 'package:posts_app/app.dart';
import 'package:posts_app/locator.dart';

void main() async{
  await setupLocator();
  runApp(const MyApp());
}
