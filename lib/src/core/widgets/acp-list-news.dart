import 'package:flutter/material.dart';
import 'package:news/src/core/models/news-model.dart';
import 'package:news/src/screens/tabs/tab1/tab1-widget.dart';

class ACPListNewsWidget extends StatelessWidget {
  final List<Article> news;

  const ACPListNewsWidget({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          return Notice(
            noti: news[index],
            index: index,
          );
        });
  }
}
