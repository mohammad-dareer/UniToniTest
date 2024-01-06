import 'package:getx_clean_architecture/domain/entities/paging.dart';

abstract class NewsRepository {
  Future<Paging> fetchNews(String keyword, int page, int pageSize);
}
