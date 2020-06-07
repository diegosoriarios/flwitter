import 'package:flutter/material.dart';
import 'package:flwitter/models/Book.dart';
import 'package:flwitter/models/State.dart';
import 'package:flwitter/services/api.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Consumer<StateModel>(
          builder: (context, book, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("Press"),
                  onPressed: () async => {
                    book.bookFound(await booksApi("Argo"))
                  },
                ),
                Text(book.book is Book ? book.book.title : "")
              ],
            );
          },
        ),
      )
    );
  }
}