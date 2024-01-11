import 'package:blog_app_flutter/global.dart';

class EditorModel {
  final String fullname, type, image;
  final int trending_count, bookmarked_count, favorite_count, awards_count;
  final List<EditorArticleModel> articles;

  Status status;

  EditorModel({
    required this.status,
    required this.image,
    required this.fullname,
    required this.type,
    required this.trending_count,
    required this.bookmarked_count,
    required this.favorite_count,
    required this.awards_count,
    required this.articles,
  });

  factory EditorModel.fromJson(Map<String, dynamic> json) {
    return EditorModel(
      status: json['status'],
      image: json['image'],
      articles: (json['articles'] as List)
          .map((i) => EditorArticleModel.fromJson(i))
          .toList(),
      bookmarked_count: json['bookmarked_count'],
      trending_count: json['trending_count'],
      fullname: json['fullname'],
      awards_count: json['awards_count'],
      favorite_count: json['favorite_count'],
      type: json['type'],
    );
  }
}

class EditorArticleModel {
  final String articleId, categoryId;

  EditorArticleModel({
    required this.articleId,
    required this.categoryId,
  });

  factory EditorArticleModel.fromJson(Map<String, dynamic> json) {
    return EditorArticleModel(
      articleId: json['articleId'],
      categoryId: json['categoryId'],
    );
  }
}
