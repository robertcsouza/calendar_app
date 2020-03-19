import 'package:calendar_app/Agendamento.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fab_dialer/flutter_fab_dialer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getflutter/getflutter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          MaterialPageRoute(builder: (context) => Agendamento()),
        );
      }, "Bronzeamento artificial", Colors.blue, Colors.white, true),
      new FabMiniMenuItem.withText(
          new Icon(Icons.add), Colors.blue, 4.0, "Button menu", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Agendamento()),
        );
      }, "Brozeamento Natural", Colors.blue, Colors.white, true),
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
                  Colors.redAccent,
                  Colors.purpleAccent,
                  Colors.yellowAccent
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
      body: Center(
        // INICiO CARD //
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Card(
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
                          "Texto de teste do CardBox",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              height: 2,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Uma breve descrição",
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
                )
              ],
            ),
          ),
        ),
      ),
      // FIM CARD //
      floatingActionButton:
          FabDialer(_fabMiniMenuItemList, Colors.blue, new Icon(Icons.add)),
    );
  }
}
