class PostModel {
  final String title,
      media,
      content,
      type,
      authorId,
      categoryId,
      categoryName,
      authorName,
      date,
      id;
  final bool isTrending;

  PostModel({
    required this.id,
    required this.title,
    required this.media,
    required this.content,
    required this.type,
    required this.authorId,
    required this.categoryId,
    required this.categoryName,
    required this.authorName,
    required this.date,
    required this.isTrending,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      type: json['type'],
      id: json['_id'],
      authorId: json['authorId'],
      authorName: json['authorName'],
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      content: json['content'],
      date: json['date'],
      isTrending: json['isTrending'],
      media: json['media'],
      title: json['title'],
    );
  }
}
