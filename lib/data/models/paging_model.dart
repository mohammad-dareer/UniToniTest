import 'package:getx_clean_architecture/data/models/news_model.dart';
import 'package:getx_clean_architecture/domain/entities/paging.dart';

class PagingModel extends Paging {
  PagingModel({
    required this.totalResults,
    required this.news,
  }) : super(news: news, totalResults: totalResults);

  final int totalResults;
  final List<NewsModel> news;

  @override
  factory PagingModel.fromJson(Map<String, dynamic> json) => PagingModel(
        totalResults: json["totalResults"],
        news:
            List.from(json["articles"].map((x) => NewsModel.fromJson(x))),
      );
}
