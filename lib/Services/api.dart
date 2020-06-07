import 'dart:convert' as convert;
import 'package:flwitter/models/Book.dart';
import 'package:http/http.dart' as http;

Future<Book> booksApi(String name) async {
  var url = 'https://www.googleapis.com/books/v1/volumes?q={$name}';

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var book = jsonResponse['items'][0]['volumeInfo'];
    var title = book['title'];
    var description = book['description'];
    var authors = book['authors'][0];
    var categories = book['categories'][0];
    var image = book['imageLinks']['thumbnail'];
    
    var newBook = new Book(title, description, authors, categories, image);
    return newBook;

    //print('New book Found.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }
}