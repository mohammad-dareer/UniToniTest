import 'package:getx_clean_architecture/data/models/paging_model.dart';
import 'package:getx_clean_architecture/data/providers/network/apis/news_api.dart';
import 'package:getx_clean_architecture/domain/repositories/news_repository.dart';

class NewsRepositoryIml extends NewsRepository {


  @override
  Future<PagingModel> fetchNews(
      String keyword, int page, int pageSize) async {
    final response =
        await NewsAPI.fetchNews(keyword, page, pageSize).request();
    return PagingModel.fromJson(response);
  }
}
