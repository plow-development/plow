import 'dart:convert';

import 'package:plow/models/EventsModels.dart';
import 'package:http/http.dart' as http;
import 'package:plow/models/NewsModels.dart';

class ApiService {
  static const url = 'https://livesports.herokuapp.com';

  Future<List<EventsModel>> getAllEvents() async {
    final http.Response response = await http.get(
      Uri.parse('$url/event/list'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      List<EventsModel> _events = [];
      List<dynamic> _json = json.decode(response.body);

      for (var element in _json) {
        _events.add(EventsModel.fromJson(element));
      }

      return _events;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<NewsModel>> getAllNews() async {
    final http.Response response = await http.get(
      Uri.parse('$url/news/list'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      List<NewsModel> _news = [];
      List<dynamic> _json = json.decode(response.body);

      for (var element in _json) {
        _news.add(NewsModel.fromJson(element));
      }

      return _news;
    } else {
      throw Exception('Failed');
    }
  }
}
