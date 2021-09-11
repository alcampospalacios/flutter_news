import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news/src/core/models/category-model.dart';
import 'package:news/src/core/models/news-model.dart';
import 'package:news/src/core/utils/dio-manager.dart';

class NewsServices extends ChangeNotifier with DioManager {
  final _base_url = 'https://newsapi.org/';
  final _endpoint =
      'v2/top-headlines?country=us&apiKey=6f6607db969e4bd39160f8778c318f40';
  List<Article> headlines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

// Constructor
  NewsServices() {
    this.getTopHeadlines();
  }

  // Methods
  getTopHeadlines() {
    this.getHttp(_base_url, _endpoint).then((value) {
      final newsResponse = NewsModel.fromJson(value.toString());

      this.headlines.addAll(newsResponse.articles);
      notifyListeners();
    });
  }
}
