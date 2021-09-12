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
        ),
        _CardTitle(
          noti: noti,
        ),
        _CardImage(
          noti: noti,
        ),
        _CardDrescription(noti: noti),
        SizedBox(
          height: 10,
        ),
        Divider(),
        _CardFooter()
      ],
    );
  }
}

class _CardFooter extends StatelessWidget {
  const _CardFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: customTheme.accentColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border),
          ),
          SizedBox(
            width: 15,
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}

class _CardDrescription extends StatelessWidget {
  final Article noti;
  const _CardDrescription({Key? key, required this.noti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text((noti.description != null) ? noti.description : ''));
  }
}

class _CardImage extends StatelessWidget {
  final Article noti;
  const _CardImage({Key? key, required this.noti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (noti.urlToImage != null)
                ? FadeInImage(
                    placeholder: AssetImage('assets/images/loading.gif'),
                    image: NetworkImage(noti.urlToImage),
                  )
                : Image(
                    image: AssetImage('assets/images/no-image.png'),
                  )),
      ),
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

  const _CardTopBar({Key? key, required this.noti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${noti.source.name}',
            style: TextStyle(color: customTheme.accentColor),
          ),
        ],
      ),
    );
  }
}
