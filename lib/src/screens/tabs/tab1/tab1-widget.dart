import 'package:flutter/material.dart';
import 'package:news/src/core/models/news-model.dart';
import 'package:news/src/core/utils/theme/custom-theme.dart';

class Notice extends StatelessWidget {
  final Article noti;
  final int index;
  const Notice({Key? key, required this.noti, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _CardTopBar(
          noti: noti,
          index: index,
        ),
        _CardTitle(
          noti: noti,
        ),
        _CardImage(
          noti: noti,
        )
      ],
    );
  }
}

class _CardImage extends StatelessWidget {
  final Article noti;
  const _CardImage({Key? key, required this.noti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(noti.urlToImage),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Article noti;
  const _CardTitle({Key? key, required this.noti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noti.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _CardTopBar extends StatelessWidget {
  final Article noti;
  final int index;
  const _CardTopBar({Key? key, required this.noti, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}',
            style: TextStyle(color: customTheme.accentColor),
          ),
          Text(
            '${noti.source.name}',
            style: TextStyle(color: customTheme.accentColor),
          ),
        ],
      ),
    );
  }
}
