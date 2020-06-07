import 'package:flutter/material.dart';
import 'package:flwitter/models/State.dart';
import 'package:flwitter/pages/HomeScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StateModel>(
      create: (context) => StateModel(), 
      child: MaterialApp(
        title: 'Blog',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}