import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ith/main.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  startApp('czech');
}