import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/presentation/controllers/news/news_binding.dart';
import 'package:getx_clean_architecture/presentation/pages/news/news_page.dart';

class HomePage extends GetView<GetxController> {
  @override
  Widget build(BuildContext context) {
    NewsBinding().dependencies();
    return MaterialApp(
        home: NewsPage()
    );
  }
}
