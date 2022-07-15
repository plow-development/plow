
import 'package:plow/models/SportsModels.dart';

class NewsModel {
  final int id;
  final String title;
  final String content;
  final String preview;
  final DateTime publicTime;
  final SportsModel sport;

  NewsModel({
    required this.id,
    required this.title,
    required this.content,
    required this.preview,
    required this.publicTime,
    required this.sport,
  });
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(id: json["news"]["news_id"], title: json["news"]["title"],
        content: json["news"]["content"], preview: json["news"]["preview"],
        publicTime: DateTime.parse(json["news"]["publictime"]), sport: SportsModel.fromJson(json["sport"]));
  }
}