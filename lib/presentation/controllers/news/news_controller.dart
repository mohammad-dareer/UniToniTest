import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/domain/entities/news.dart';
import 'package:getx_clean_architecture/domain/entities/paging.dart';
import 'package:getx_clean_architecture/domain/usecases/fetch_news_use_case.dart';
import 'package:tuple/tuple.dart';

class NewsController extends GetxController {
  NewsController(this._fetchNewlineUseCase);
  final FetchNewsUseCase _fetchNewlineUseCase;
  int _firstListCurrentPage = 1;
  int _secondListCurrentPage = 1;
  int _pageSize = 20;
  var _secondListLoadMore = false;
  var _firstListLoadMore = false;
  var _paging = Rx<Paging?>(null);
  TextEditingController firstSearchController = TextEditingController();
  TextEditingController secondSearchController = TextEditingController();
  var firstListArticles = RxList<News>([]);
  var secondListArticles = RxList<News>([]);

  fetchDataFirstList(String keyword) async {
    _firstListCurrentPage = 1;
    final newPaging = await _fetchNewlineUseCase
        .execute(Tuple3(keyword, _firstListCurrentPage, _pageSize));
    firstListArticles.assignAll(newPaging.news);
    _paging.value = newPaging;
  }
  fetchDataSecondList(String keyword) async {
    _secondListCurrentPage = 1;
    final newPaging = await _fetchNewlineUseCase
        .execute(Tuple3(keyword, _secondListCurrentPage, _pageSize));
    secondListArticles.assignAll(newPaging.news);
    _paging.value = newPaging;
  }

  firstListLoadMore(String keyword) async {
    final totalResults = _paging.value?.totalResults ?? 0;
    if (totalResults / _pageSize <= _firstListCurrentPage) return;
    if (_firstListLoadMore) return;
    _firstListLoadMore = true;
    _firstListCurrentPage += 1;
    final newPaging = await _fetchNewlineUseCase
        .execute(Tuple3(keyword, _firstListCurrentPage, _pageSize));
    firstListArticles.addAll(newPaging.news);
    _paging.value?.totalResults = newPaging.totalResults;
    _firstListLoadMore = false;
  }
  secondListLoadMore(String keyword) async {
    final totalResults = _paging.value?.totalResults ?? 0;
    if (totalResults / _pageSize <= _secondListCurrentPage) return;
    if (_secondListLoadMore) return;
    _secondListLoadMore = true;
    _secondListCurrentPage += 1;
    final newPaging = await _fetchNewlineUseCase
        .execute(Tuple3(keyword, _secondListCurrentPage, _pageSize));
    firstListArticles.addAll(newPaging.news);
    _paging.value?.totalResults = newPaging.totalResults;
    _firstListLoadMore = false;
  }
}
