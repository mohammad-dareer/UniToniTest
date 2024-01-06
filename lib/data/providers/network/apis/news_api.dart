
import 'package:getx_clean_architecture/data/providers/network/api_endpoint.dart';
import 'package:getx_clean_architecture/data/providers/network/api_provider.dart';
import 'package:getx_clean_architecture/data/providers/network/api_request_representable.dart';


class NewsAPI implements APIRequestRepresentable {
  String? keyword;
  int? page;
  int? pageSize;

  NewsAPI._({ this.keyword, this.page, this.pageSize});

  NewsAPI.fetchNews(String keyword, int page, int pageSize)
      : this._(
            keyword: keyword,
            page: page,
            pageSize: pageSize);

  @override
  String get endpoint => APIEndpoint.newsapi;

  String get path {
    return "/top-headlines";
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  Map<String, String> get headers => {};

  Map<String, String> get query {
    return {"page": "$page", "pageSize": "$pageSize", "q": keyword ?? "", "apiKey": "4167f40695554fcc92a4a3ab1475d03c"};
  }

  @override
  get body => null;

  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
