import 'package:blog_app_flutter/global.dart';

class EditorModel {
  final String fullname, type, image;
  final int trending_count, bookmarked_count, favorite_count, awards_count;
  final List<EditorArticleModel> articles;

  Status status;

  EditorModel({
    this.image,
    this.fullname,
    this.type,
    this.trending_count,
    this.bookmarked_count,
    this.favorite_count,
    this.awards_count,
    this.articles,
  });

  factory EditorModel.fromJson(Map<String, dynamic> json) {
    return EditorModel(
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
    this.articleId,
    this.categoryId,
  });

  factory EditorArticleModel.fromJson(Map<String, dynamic> json) {
    return EditorArticleModel(
      articleId: json['articleId'],
      categoryId: json['categoryId'],
    );
  }
}
