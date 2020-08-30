import 'package:flutter/material.dart';

import './home/my_home_page.dart';

void main() => runApp(MaterialApp(
      home: MyHomePage(),
      title: 'Expense Tracker',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'OpenSans',
          textTheme: ThemeData.light().textTheme.copyWith(
                //overiding the default text theme
                headline6: TextStyle(
                    //we override the already defined headline6 style
                    color: Colors.black,
                    fontFamily: 'Quicksand',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                      headline6: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )))),
    ));
