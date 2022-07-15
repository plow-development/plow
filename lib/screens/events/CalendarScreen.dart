import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:plow/models/EventsModels.dart';
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
          height: 8.0,
        ),
        Expanded(
          child: FutureBuilder<List<EventsModel>>(
            future: ApiService().getEventsByDateTime(dateTime: _dateTime),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: snapshot.data!.length,
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
                                  snapshot.data![index].preview)),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.sports_basketball, size: 15,),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(snapshot.data![index].sport.name, style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Text(snapshot.data![index].name,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 22.0),),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                    snapshot.data![index].description,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0)),
                                SizedBox(
                                  height: 12.0,
                                ),
                                ElevatedButton(onPressed: () {},
                                    child: Text('Участвовать', style: TextStyle(
                                        fontWeight: FontWeight.w600),))
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 16.0,
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          ),
        ),
      ],
    );
  }

  _updateByDate(date) {
    setState(() {
      _dateTime = date;
    });
  }
}
