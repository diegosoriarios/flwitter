import 'package:flutter/material.dart';
import 'package:flwitter/models/Book.dart';

class StateModel extends ChangeNotifier {
  Book book;

  void bookFound(Book book) {
    this.book = book;
    notifyListeners();
  }


}