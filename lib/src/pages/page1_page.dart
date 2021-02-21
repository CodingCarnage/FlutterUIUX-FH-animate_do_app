import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size textSize = _textSize('Subtitle', Theme.of(context).textTheme.subtitle1);

    return Scaffold(
      appBar: AppBar(
        title: Text('Animate_do'),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter),
            onPressed: () {},
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.chevronRight),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: FaIcon(FontAwesomeIcons.play),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.new_releases,
              color: Colors.blue,
            ),
            Text(
              'Title',
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              'Subtitle',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Container(
              width: textSize.width + 10,
              height: 2.0,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
