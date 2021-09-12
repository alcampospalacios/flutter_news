import 'package:flutter/material.dart';
import 'package:news/src/core/models/category-model.dart';
import 'package:news/src/core/services/news-services.dart';
import 'package:news/src/core/utils/theme/custom-theme.dart';
import 'package:news/src/core/widgets/acp-list-news.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsServices>(context);
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      _CategoryList(),
      Expanded(
          child: newsServices.getArticlesSelectedCategory.length != 0
              ? ACPListNewsWidget(
                  news: newsServices.getArticlesSelectedCategory,
                )
              : Center(child: CircularProgressIndicator()))
    ])));
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsServices>(context);

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: newsServices.categories.length,
          itemBuilder: (BuildContext context, int index) {
            String cName = newsServices.categories[index].text;

            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  _CategoryButton(
                    category: newsServices.categories[index],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
                ],
              ),
            );
          }),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsServices>(context, listen: false);

    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsServices>(context, listen: false);
        newsService.selectedCategory = category.text;
      },
      child: Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          category.icon,
          color: (newsService.selectedCategory == category.text)
              ? customTheme.accentColor
              : Colors.black54,
        ),
      ),
    );
  }
}
