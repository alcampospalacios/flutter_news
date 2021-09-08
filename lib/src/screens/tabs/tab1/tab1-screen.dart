import 'package:flutter/material.dart';
import 'package:news/src/core/services/news-services.dart';
import 'package:news/src/core/widgets/acp-list-news.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatelessWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsServices>(context);

    return Container(child: ACPListNewsWidget(news: newsServices.headlines));
  }
}
