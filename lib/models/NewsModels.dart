class NewsModel {
  final int id;
  final String title;
  final String content;
  final String preview;
  final DateTime publicTime;
  final int authorId;
  final int sportId;

  NewsModel({
    required this.id,
    required this.title,
    required this.content,
    required this.preview,
    required this.publicTime,
    required this.authorId,
    required this.sportId,
  });
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(id: json["news_id"], title: json["title"],
        content: json["content"], preview: json["preview"],
        publicTime: DateTime.parse(json["publictime"]), authorId: json["author_id"], sportId: json["sport_id"]);
  }
}