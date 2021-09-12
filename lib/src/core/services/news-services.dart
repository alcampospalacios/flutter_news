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

  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

// Constructor
  NewsServices() {
    this.getTopHeadlines();

    categories.forEach((element) {
      categoryArticles[element.text] = [];
    });
  }

  // Getters and Setters
  String get selectedCategory => this._selectedCategory;
  set selectedCategory(String category) {
    this._selectedCategory = category;
    this.getArticlesByCategory(category);
    notifyListeners();
  }

  List<Article> get getArticlesSelectedCategory =>
      this.categoryArticles[this.selectedCategory]!;

  // Methods
  getTopHeadlines() {
    this.getHttp(_base_url, _endpoint).then((value) {
      final newsResponse = NewsModel.fromJson(value.toString());

      this.headlines.addAll(newsResponse.articles);
      notifyListeners();
    });
  }

  getArticlesByCategory(String category) {
    if (this.categoryArticles[category]!.length > 0) {
      return this.categoryArticles[category];
    }

    String endpoint =
        'v2/top-headlines?country=us&apiKey=6f6607db969e4bd39160f8778c318f40&category=$category';

    this.getHttp(_base_url, endpoint).then((value) {
      final newsResponse = NewsModel.fromJson(value.toString());
      this.categoryArticles[category]!.addAll(newsResponse.articles);

      notifyListeners();
    });
  }
}
