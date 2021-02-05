import 'package:flutter/material.dart';


class CatePosts extends StatelessWidget {
  final id;
  static const routeName = 'catposts';

  const CatePosts({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Map catpost  = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold();
  }
}
