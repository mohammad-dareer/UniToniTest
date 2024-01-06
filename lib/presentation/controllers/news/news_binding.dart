import 'package:get/get.dart';
import 'package:getx_clean_architecture/data/repositories/news_repository.dart';
import 'package:getx_clean_architecture/domain/usecases/fetch_news_use_case.dart';
import 'package:getx_clean_architecture/presentation/controllers/news/news_controller.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchNewsUseCase(Get.find<NewsRepositoryIml>()));
    Get.lazyPut(() => NewsController(Get.find()));
  }
}
