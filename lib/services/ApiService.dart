import 'dart:convert' show json, jsonEncode, utf8;

import 'package:plow/models/EventsModels.dart';
import 'package:http/http.dart' as http;
import 'package:plow/models/NewsModels.dart';

import '../models/BroadcastsModels.dart';

class ApiService {
  static const url = 'https://livesports.herokuapp.com';

  Future<List<EventsModel>> getEventsByDateTime({required DateTime dateTime}) async {
    final http.Response response = await http.get(
      Uri.parse('$url/event/list_by_datetime?starttime='+dateTime.toString().split(' ')[0]),
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
      List<dynamic> _json = json.decode(utf8.decode(response.body.codeUnits));

      for (var element in _json) {
        _news.add(NewsModel.fromJson(element));
      }

      return _news;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<BroadcastsModel>> getAllBroadcast() async {
    final http.Response response = await http.get(
      Uri.parse('$url/broadcast/list'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      List<BroadcastsModel> _broadcasts = [];
      List<dynamic> _json = json.decode(utf8.decode(response.body.codeUnits));

      for (var element in _json) {
        _broadcasts.add(BroadcastsModel.fromJson(element));
      }

      return _broadcasts;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<NewsModel>> getNewsByInterests() async {
    final http.Response response = await http.get(
      Uri.parse('$url/news/list_by_interests?user_id=2'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      List<NewsModel> _news = [];
      List<dynamic> _json = json.decode(utf8.decode(response.body.codeUnits));

      for (var element in _json) {
        _news.add(NewsModel.fromJson(element));
      }

      return _news;
    } else {
      throw Exception('Failed');
    }
  }
}
