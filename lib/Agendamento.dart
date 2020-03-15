import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'expandable_card.dart';
class Agendamento extends StatefulWidget {
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title:Text('Flutter Calendario') ,
        elevation: 0,
      ),

      body:ExpandableCardPage(
        page: Center(
          child: Column(
            children: <Widget>[
              TableCalendar(
                initialCalendarFormat: CalendarFormat.month ,
                calendarController: _controller,

                calendarStyle:CalendarStyle(
                  todayColor: Colors.orange,

                  weekdayStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  weekendStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),

                  outsideDaysVisible: false,


                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.white
                  ),
                ),

                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                      color: Colors.white
                  ),
                  weekendStyle: TextStyle(
                      color: Colors.white
                  ),
                ),


                headerStyle:HeaderStyle(
                  centerHeaderTitle: true,

                  titleTextStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ) ,

                  formatButtonDecoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  formatButtonTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                  ),
                  formatButtonShowsNext: false,

                ) ,

                startingDayOfWeek: StartingDayOfWeek.monday ,
                onDaySelected: (date,events){
                  setState(() {
                    data = date.toIso8601String();
                  });
                },
                builders: CalendarBuilders(
                    todayDayBuilder:(context,date,events) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment:Alignment.center ,

                        decoration: BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),

                        child: Text(date.day.toString(),style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),)) ,
                    selectedDayBuilder: (context,date,events) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment:Alignment.center ,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),

                        child: Text(date.day.toString(),style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),))
                ) ,
              ),

            ],
          ),
        ),
        expandableCard: ExpandableCard(
          hasRoundedCorners: true,
          maxHeight: 600,
          minHeight: 200,
          backgroundColor: Colors.white,
          children: <Widget>[

            Column(

              children: <Widget>[

                Align(
                  alignment: Alignment.topLeft,
                  child:  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Agendar",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),
                  )
                  ,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text("Dia",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            width: 150,
                            height: 50,
                            child: Center(
                              child: Text("14/03/2020"),
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(240,247,243,1),
                                borderRadius: BorderRadius.circular(40)
                            ),

                          ),
                        ),
                      ],
                    ),Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text("Brozeamento",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            width: 150,
                            height: 50,
                            child: Center(
                              child: Text("Natural"),
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(240,247,243,1),
                                borderRadius: BorderRadius.circular(40)
                            ),

                          ),
                        ),
                      ],
                    )
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text("Periodo",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            width: 150,
                            height: 50,
                            child: Center(
                              child: Text("Manhã"),
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(240,247,243,1),
                                borderRadius: BorderRadius.circular(40)
                            ),

                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 350.0,
                    height: 60.0,
                    color: Colors.blue,
                    //Color.fromRGBO(61,131,253,1),
                    child: RaisedButton(
                      color:Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: Text('Agendar', style:
                            TextStyle(color: Colors.white,
                              fontSize: 16,
                            ),
                            ),
                          ),
                          Container(
                            height: 60,
                            decoration:BoxDecoration(
                              border:Border.all(color: Colors.grey),
                            ),

                          ),

                          Icon(Icons.check, color: Colors.white,size: 40,),

                        ],
                      ),
                    ),
                  ),
                )


              ],

            )
          ],
        ),
      ),

    );
  }
}