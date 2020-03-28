import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flwitter/Services/api.dart';

class DetailsPage extends StatelessWidget {
  final String tag;
  final String title;
  final repository = new PostRepository();

  DetailsPage({@required this.tag, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: FutureBuilder(
        future: repository.getPostBody(tag),
        builder: (context, snap) {
          if (snap.hasData) {
            String data = snap.data;

            return Markdown(
              data: data,
              styleSheet: MarkdownStyleSheet(
                h2: TextStyle(
                  color: Colors.black54,
                  fontSize: 22
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator()
            );
          }
        },
      )
    );
  }
}