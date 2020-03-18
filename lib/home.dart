import 'package:calendar_app/Agendamento.dart';
import 'package:flutter_fab_dialer/flutter_fab_dialer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static String getNewCatUrl() {
    return 'http://thecatapi.com/api/images/get?format=src&type=jpg&size=small'
        '#${new DateTime.now().millisecondsSinceEpoch}';
  }

  int _counter = 0;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
}


  @override
  Widget build(BuildContext context) {





    var _fabMiniMenuItemList = [

      new FabMiniMenuItem.withText(
          new Icon(Icons.add),
          Colors.orange,
          4.0,
          "Button menu",
              (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Agendamento()),
            );
          },
          "Bronzeamento artificial",
          Colors.blue,
          Colors.white,
          true),

      new FabMiniMenuItem.withText(
          new Icon(Icons.add),
          Colors.blue,
          4.0,
          "Button menu",
              (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Agendamento()),
            );
          },
          "Brozeamento Natural",
          Colors.blue,
          Colors.white,
          true),


    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Main"),
      ),
      body: Center(
          child: GestureDetector(
            onTap:(){

            },
            child: Text("No momento você nao Possui Agendamentos", style:
            TextStyle(

              fontSize: 24,
              color: Colors.grey,
            ),
              textAlign: TextAlign.center,),
          )
      ),

      floatingActionButton: FabDialer(_fabMiniMenuItemList, Colors.blue, new Icon(Icons.add)),
    );
  }
}