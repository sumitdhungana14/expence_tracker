import 'package:expence_tracker/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './home/my_home_page.dart';

void main() {
  
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  return runApp(MaterialApp(
    home: MyHomePage(),
    title: 'Expense Tracker',
    theme: AppTheme.getAppTheme(),
  ));
}
