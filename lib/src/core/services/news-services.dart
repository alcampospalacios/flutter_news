import 'package:flutter/material.dart';
import 'package:news/src/core/models/news-model.dart';
import 'package:news/src/core/utils/dio-manager.dart';

class NewsServices extends ChangeNotifier with DioManager {
  final _base_url = 'https://newsapi.org/';
  final _endpoint =
      'v2/top-headlines?country=us&apiKey=6f6607db969e4bd39160f8778c318f40';
  List<Article> headlines = [];

// Constructor
  NewsServices() {
    this.getTopHeadlines();
  }

  // Methods
  getTopHeadlines() {
    this.getHttp(_base_url, _endpoint).then((value) {
      print('res: $value');
    });
    // final newsResponse = NewsModel.fromJson(res.toString());

    // print('fromJson: $newsResponse');
  }
}
