import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:plow/services/ApiService.dart';
import 'package:plow/services/ColorService.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ApiService().getAllEvents().then((value) => {
      print(value[0].name)
    });
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: CalendarTimeline(
            initialDate: _dateTime,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: _updateByDate,
            leftMargin: 20,
            monthColor: Colors.black.withAlpha(150),
            dayColor: ColorService().primaryColor.shade600,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: ColorService().primaryColor,
            dotsColor: Colors.white,
            locale: 'ru',
          ),
        ),
        Container(
          color: Colors.white,
          height: 16.0,
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16.0),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                          offset: Offset(1, 2))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                        child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/InageMinkanKoukuuKinenkan20101223.jpg/1200px-InageMinkanKoukuuKinenkan20101223.jpg')),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.sports_soccer, size: 15,),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text('Футбол', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.0)),
                            ],
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Text('Соревнование по футболу', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text('Ждем всех по адресу Железнодорожная улица, 48 ', style: TextStyle(fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 12.0,
                          ),
                          ElevatedButton(onPressed: () {}, child: Text('Участвовать', style: TextStyle(fontWeight: FontWeight.w600),))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 8.0,
              );
            },
          ),
        ),
      ],
    );
  }

  _updateByDate(date) {
    setState(() {
      _dateTime = date;
      print(date);
    });
  }
}
