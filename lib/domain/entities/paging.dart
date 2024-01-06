import 'package:getx_clean_architecture/domain/entities/news.dart';

class Paging {
  Paging({
    required this.totalResults,
    required this.news,
  });

  int totalResults;
  List<News> news;
}
