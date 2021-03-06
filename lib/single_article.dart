import 'package:flutter/material.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:url_launcher/url_launcher.dart';

class SingleArticle extends StatelessWidget {

  wp.Post post;

  SingleArticle(this.post);

  _getPostImage() {
    if (post.featuredMedia == null) {
      return SizedBox(height: 10,);
    } else {
      return Image.network(post.featuredMedia.sourceUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: Container(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                Text(
                  post.title.rendered.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                _getPostImage(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(post.date.replaceAll('T', ' ')),
                    Text(post.author.name.toString())
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text(post.content.rendered.toString()),
                ),
              ],
            ),
          )
      ),
    );
  }
}

_launchUrl(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    throw 'Cannot launch $link';
  }
}
