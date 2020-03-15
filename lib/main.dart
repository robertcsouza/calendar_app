import 'package:calendar_app/Agendamento.dart';
import 'package:calendar_app/fancy_fab.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Main"),
    ),
    body: Container(
      child: Center(
        child: GestureDetector(
          onTap:(){

          },
          child: Text("No momento você nao Possui Agendamentos", style:
          TextStyle(
            fontSize: 24,
            color: Colors.grey,
          ),),
        )
      ),
    ),
    floatingActionButton:FancyFab() ,

  );
  }
  }



