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
    this.id,
    this.title,
    this.media,
    this.content,
    this.type,
    this.authorId,
    this.categoryId,
    this.categoryName,
    this.authorName,
    this.date,
    this.isTrending,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
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
