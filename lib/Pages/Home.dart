import 'package:flutter/material.dart';
import 'package:flwitter/Models/post.dart';
import 'package:flwitter/Pages/Details.dart';
import 'package:flwitter/Services/api.dart';

class HomePage extends StatelessWidget {
  final repository = new PostRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog"),
      ),
      body: FutureBuilder(
        future: repository.getAll(),
        builder: (context, snap) {
          if (snap.hasData) {
            List<Post> posts = snap.data;

            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(posts[i].title),
                  subtitle: Text(posts[i].author.name),
                  leading: Image.network(posts[i].author.image),
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          tag: posts[i].meta.url,
                          title: posts[i].title,
                        )
                      )
                    );
                  },
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}