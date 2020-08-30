import 'package:expence_tracker/theme/app_theme.dart';
import 'package:flutter/material.dart';

import './home/my_home_page.dart';

void main() => runApp(MaterialApp(
      home: MyHomePage(),
      title: 'Expense Tracker',
      theme: AppTheme.getAppTheme(),
    ));
