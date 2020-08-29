import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: 'Flutter App',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Expence Tracer'),
            ),
            body: Column(
                children: <Widget>[
              Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(50),
                  width: double.infinity,
                    child: Text('Chart')
                  ),
              ),
              Card(child: Container(
                  padding: EdgeInsets.all(50),
                  width: double.infinity,
                  child: Text('Transaction List')
                )),
            ]),
            floatingActionButton: FloatingActionButton(
              onPressed: (){

              },
              child: Text('+',
              style: TextStyle(
                fontSize: 22
              ),),
            ),));
  }
}
