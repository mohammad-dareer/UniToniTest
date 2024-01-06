import 'package:getx_clean_architecture/domain/entities/news.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel extends News {
  NewsModel({
    this.author,
    this.title,

    this.urlToImage,
    this.publishedAt,

  }) : super(
            author: author,
            title: title,
            urlToImage: urlToImage,
            publishedAt: publishedAt,);

  String? author;
  String? title;
  String? urlToImage;
  DateTime? publishedAt;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
