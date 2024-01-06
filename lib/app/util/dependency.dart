import 'package:get/get.dart';
import 'package:getx_clean_architecture/data/repositories/news_repository.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => NewsRepositoryIml());
  }
}
