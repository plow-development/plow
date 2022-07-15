class NewsModel {
  final int id;
  final String title;
  final String content;
  final String preview;
  final String publicTime;
  final int authorId;

  NewsModel({
    required this.id,
    required this.title,
    required this.content,
    required this.preview,
    required this.publicTime,
    required this.authorId,
  });
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(id: json["id"], title: json["title"],
        content: json["content"], preview: json["preview"],
        publicTime: json["publicTime"], authorId: json["authorId"]);
  }
}