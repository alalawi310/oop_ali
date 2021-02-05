import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oop_ali/category_posts.dart';
import 'package:oop_ali/products.dart';

class Categories extends StatelessWidget {
  static const routeName = 'categories';


  @override
  Widget build(BuildContext context) {
    Map cat = ModalRoute.of(context).settings.arguments as Map;
    return MaterialApp(
      routes: {
        CatePosts.routeName: (BuildContext context) => CatePosts(),
      },
      home: Scaffold(
        body: FutureBuilder(
          future: mycat(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Map cats = snapshot.data[index];
                  return Card(
                    child: Center(
                      child: InkWell(
                        child: Text(
                          cats['name'],style: TextStyle(
                          fontSize: 26.0,
                        ),
                        ),
                        onTap: () => Navigator.of(context)
                            .pushNamed(CatePosts.routeName, arguments: 'link')
                      ),
                    ),
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
      ),
    );
  }
}
