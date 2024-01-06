import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/types/category_type.dart';
import 'package:getx_clean_architecture/presentation/controllers/news/news_controller.dart';
import 'package:getx_clean_architecture/presentation/pages/news/news_cell.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPagePage createState() => _NewsPagePage();
}

class _NewsPagePage extends State<NewsPage> {
  final NewsController newsController = Get.find();
  final _firstListScrollController = ScrollController();
  final _secondListScrollController = ScrollController();
  CategoryType _currentCategory = CategoryType.bitcoin;

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: newsController,
      didUpdateWidget: (old, newState) {
        _firstListScrollController.addListener(_firstListScrollListener);
        _secondListScrollController.addListener(_firstListScrollListener);
      },
      dispose: (state) {
        _firstListScrollController.removeListener(_secondListScrollListener);
        _secondListScrollController.removeListener(_secondListScrollListener);
      },
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('News'),
              centerTitle: true,
            ),
            body: Container(
              child: Column(
                children: [
                   Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'First Search',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter a search term',
                            ),
                            controller: newsController.firstSearchController,
                            onChanged: (val){
                              newsController.fetchDataFirstList(newsController.firstSearchController.value.text);
                            }
                          ),
                        ],
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Second Search',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter a search term',
                            ),
                            controller: newsController.secondSearchController,
                            onChanged: (val){
                              newsController.fetchDataSecondList(newsController.secondSearchController.value.text);
                            }
                        ),
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    child: Container(
                      height: 250,
                      child: ListView.builder(
                        controller: _firstListScrollController,
                        itemCount: newsController.firstListArticles.length,
                        itemBuilder: (context, index) {
                          final firstNews = newsController.firstListArticles[index];
                          return NewsCell(news: firstNews);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    child: Container(
                      height: 250,
                      child: ListView.builder(
                        controller: _secondListScrollController,
                        itemCount: newsController.secondListArticles.length,
                        itemBuilder: (context, index) {
                          final secondNews = newsController.secondListArticles[index];
                          return NewsCell(news: secondNews);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  _firstListScrollListener() {
    if (_firstListScrollController.position.extentAfter < 500) {
      newsController.firstListLoadMore(_currentCategory.keyword);
    }
  }
  _secondListScrollListener() {
    if (_secondListScrollController.position.extentAfter < 500) {
      newsController.secondListLoadMore(_currentCategory.keyword);
    }
  }
}
