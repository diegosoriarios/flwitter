import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flwitter/Models/post.dart';
import 'package:flwitter/Pages/Details.dart';
import 'package:flwitter/Services/api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final repository = new PostRepository();

  Future _deletePost(post) async {
    var id = post.sId;
    var url = "http://localhost:3001/posts/?_id=$id";
    Response response = await Dio().delete(url);
    //print(response);
    Navigator.of(context).pop();
  }

  void _exibirDialog(post) {
    Widget cancelaButton = FlatButton(
      child: Text("Não"),
      onPressed:  () => Navigator.of(context).pop(),
    );
    Widget continuaButton = FlatButton(
      child: Text("Sim"),
      onPressed:  () {
        _deletePost(post);
      },
    );
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Deseja excluir post?"),
      actions: [
        cancelaButton,
        continuaButton,
      ],
    );

    showDialog(
      context:  context,
      builder:  (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

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
                  onLongPress: (() {
                    _exibirDialog(posts[i]);
                  }),
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