
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_fab_dialer/flutter_fab_dialer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getflutter/getflutter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:http/http.dart'as http;

import 'Agendamento.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  String idCliente = "";

  Future<List> _recuperarAgendamento() async{
    String url = "http://191.252.223.69:3000/agendamentos/5e76a377eaa362e65527ecdc";
    http.Response response = await http.get(url);
    idCliente = "5e76a377eaa362e65527ecdc";
    return json.decode(response.body);

  }

  static String getNewCatUrl() {
    return 'http://thecatapi.com/api/images/get?format=src&type=jpg&size=small'
        '#${new DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    var _fabMiniMenuItemList = [
      new FabMiniMenuItem.withText(
          new Icon(Icons.add), Colors.orange, 4.0, "Button menu", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Agendamento(tipo: "artificial" ,)),
        );
      }, "Bronzeamento artificial", Colors.orange, Colors.white, true),
      new FabMiniMenuItem.withText(
          new Icon(Icons.add), Colors.red, 4.0, "Button menu", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Agendamento(tipo: "natural",)),
        );
      }, "Brozeamento Natural", Colors.red, Colors.white, true),
    ];

    return Scaffold(
      // INICiO TopBar //
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              child: GradientAppBar(
                gradient: LinearGradient(colors: [
                  Colors.blue,
                  Colors.lightBlue,
                  Colors.blueAccent
                ]),
                title: Text(
                  "TopBar Gradient",
                  style: TextStyle(
                      fontSize: 20, height: 1, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
      // FIM TopBar //
      body: FutureBuilder<List>(
                  future: _recuperarAgendamento(),
                  builder: (context,snapshot){
                    String resultado;
                    switch(snapshot.connectionState){

                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        print("conexao waiting");
                        resultado = "Carregando...";
                        break;
                      case ConnectionState.active:
                      case ConnectionState.done:
                        print("conexao done");
                        if(snapshot.hasError){
                          resultado = snapshot.error.toString();
                        }else{

                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index){

                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Card(
                                  margin:
                                  EdgeInsets.only(left: 0, right: 0, top: 1.0, bottom: 1.0),
                                  color: Colors.grey[140],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          bottomRight: Radius.circular(40))),
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(40),
                                            bottomRight: Radius.circular(40)),
                                        border: Border.all(
                                            color: Colors.lightBlueAccent, width: 2)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Bonzeamento "+snapshot.data[index]['bronzeamento'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 20,
                                              height: 2,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Data: "+snapshot.data[index]['data']+"  periodo: "+snapshot.data[index]['periodo'],
                                          style: TextStyle(fontSize: 15, height: 2),
                                        ),
                                        ButtonTheme(
                                          child: ButtonBar(
                                            children: <Widget>[
                                              GFButton(
                                                onPressed: () {},
                                                text: "DETALHES",
                                                shape: GFButtonShape.pills,
                                                type: GFButtonType.solid,
                                                color: GFColors.INFO,
                                              ),
                                              GFButton(
                                                onPressed: () {},
                                                text: "CANCELAR",
                                                shape: GFButtonShape.pills,
                                                type: GFButtonType.solid,
                                                color: GFColors.DANGER,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          );

                        }
                        break;



                    }

                    return Center(
                      child: Text(resultado),
                    );
                  },
                ),
      // FIM CARD //
      floatingActionButton:
      FabDialer(_fabMiniMenuItemList, Colors.blue, new Icon(Icons.add)),
    );
  }
}