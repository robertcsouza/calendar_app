import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
//import 'package:calendar_app/activitys/expandable_card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:http/http.dart' as http;

class Agendamento extends StatefulWidget {
  String tipo;
  Agendamento({this.tipo});

  @override
  _HomePageState createState() => _HomePageState();
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Agendamento> {
  CalendarController _controller;
  String data = "date";
  double fontSize = 12.0;
  String clima = "image/chuva.png";
  String porcentageChuva = "0";
  String disponibilidade = "disponibilidade";
  double expandableSize = 0;
  String manha = "08:00 - 12:00";
  String tarde = "12:00 - 18:00";
  String today = "";



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String dia  = DateTime.now().day.toString();
    String mes  = DateTime.now().month.toString();
    String ano  = DateTime.now().year.toString();
    String d = "${dia}-${mes}-${ano}";
    setState(() {
      data = d;
      _recuperarInformacoes();
    });
    _controller = CalendarController();



  }

  Future<Map> _recuperarInformacoes() async {
    String url = "http://191.252.223.69:3000/${widget.tipo}/${data}";
    http.Response response = await http.get(url);
    Map<String, dynamic> res = json.decode(response.body)[0];

    return res;
  }



  @override
  Widget build(BuildContext context) {
    expandableSize = MediaQuery.of(context).size.height * 0.60;
    double mediaWidth = MediaQuery.of(context).size.width;
    Widget handle = Icon(
      Icons.remove,
      color: Colors.grey,
      size: 50,
    );
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Agendar Horário'),
          elevation: 0,
        ),
        body: SlidingUpPanel(
          minHeight: 200,
          maxHeight: expandableSize,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          panel: Column(
            // inicio do card

            children: <Widget>[
              handle,
              SizedBox(
                width: mediaWidth,
                height: 10,
              ),
              FutureBuilder<Map>(
                future: _recuperarInformacoes(),
                builder: (BuildContext context, snapshot) {
                  String result = " ";
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      result = "Carregando...";
                      break;
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        result = snapshot.error.toString();
                      } else {
                        result = snapshot.data['data'];

                      }

                      break;
                  }
                  return Column(

                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              "Agendamento",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 32.0),
                            child: Image(
                              image: AssetImage('./image/chuva.png'),
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  "data",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:10.0),
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6.0, horizontal: 10),
                                      child: Text(
                                        result == null ? "":result,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0xf8dc9ee),
                                        borderRadius: BorderRadius.circular(30)),
                                  ),
                                ),
                              ],
                            ),

                            //coluna horario

                            Column(
                              children: <Widget>[
                                Text(
                                  "Horário",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:10.0),
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6.0, horizontal: 10),
                                          child: Text(
                                            manha,
                                            style: TextStyle(color: Colors.black54),
                                          ),
                                        ),
                                        Icon(
                                          Icons.play_circle_filled,
                                          color: Colors.blue,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0xf8dc9ee),
                                        borderRadius: BorderRadius.circular(30)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.check,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      "Aceitar Termos de uso",
                                      style: TextStyle(color: Colors.black54),
                                    )
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xf8dc9ee),
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6.0, horizontal: 10.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.add,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      "Alterar Horario",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30.0),
                        child: FlatButton(
                          onPressed: () => {},
                          color: Colors.blue,
                          child: Container(
                            child: Row(

                              children: <Widget>[ Padding(
                                padding: const EdgeInsets.only(left:32.0),
                                child: Text("Agendar" ,style: TextStyle(
                                  color: Colors.white
                                ),),
                              ),Icon(Icons.arrow_forward,color: Colors.white,),],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(60)),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                         Radius.circular(5)
                              )
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                TableCalendar(

                  initialCalendarFormat: CalendarFormat.month,
                  calendarController: _controller,
                  calendarStyle: CalendarStyle(
                    todayColor: Colors.orange,
                    weekdayStyle: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    weekendStyle: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    outsideDaysVisible: false,
                    todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                        color: Colors.white),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Colors.white),
                    weekendStyle: TextStyle(color: Colors.white),
                  ),
                  headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                    titleTextStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    formatButtonTextStyle:
                        TextStyle(color: Colors.white, fontSize: fontSize),
                    formatButtonShowsNext: false,
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  onDaySelected: (date, events) {
                    String ano = date.year.toString();
                    String mes = date.month.toString();
                    String dia = date.day.toString();
                    String d = "${dia}-${mes}-${ano}";


                    setState(() {
                      data = d;
                    });
                    _recuperarInformacoes();
                  },

                  builders: CalendarBuilders(

                    todayDayBuilder: (context, date, events) => Container(

                        margin: const EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(15)),

                        child: Text(
                          date.day.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold),
                        )),
                    selectedDayBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
