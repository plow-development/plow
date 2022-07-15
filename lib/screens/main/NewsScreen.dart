import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:plow/models/NewsModels.dart';
import 'package:plow/services/ApiService.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
      future: ApiService().getAllNews(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            padding: const EdgeInsets.all(16.0),
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                child: Ink(
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
                              'https://only-game.ru/wp-content/uploads/b/5/5/b551245db3dc38317de2ca6dc29a7ee6.png')),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.sports_basketball,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Text('Баскетбол',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300, fontSize: 12.0)),
                              ],
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              snapshot.data![index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              DateFormat('d EEEE', 'ru').format(snapshot.data![index].publicTime),
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 12.0),
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Text(
                                snapshot.data![index].content,
                                style: TextStyle(fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ],
                  ),
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
          return Container();
        }

      }
    );
  }
}
