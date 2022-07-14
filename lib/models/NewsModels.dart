class NewsModel {
  final int id;
  final String title;
  final String content;
  final String preview;
  final DateTime publicTime;
  final int authorId;

  NewsModel({
    required this.id,
    required this.title,
    required this.content,
    required this.preview,
    required this.publicTime,
    required this.authorId,
  });
}