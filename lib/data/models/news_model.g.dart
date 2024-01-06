// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel(
    author: json['author'] as String?,
    title: json['title'] as String?,
    urlToImage: json['urlToImage'] as String?,
    publishedAt: json['publishedAt'] == null
        ? null
        : DateTime.parse(json['publishedAt'] as String),
  );
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt?.toIso8601String(),
    };
