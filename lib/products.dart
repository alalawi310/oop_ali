import 'package:http/http.dart' as http;
import 'dart:convert';

final wordpressUrl = 'https://studio-press.pro/wp-json/wp/v2/posts?_embed';

Future<List> myposts() async{
  final response = await http.get(wordpressUrl, headers: {'Accept':'application/json'});
  var convertiarjson = jsonDecode(response.body);
  return convertiarjson;
}


final catUrl = 'https://studio-press.pro/wp-json/wp/v2/categories';

Future<List> mycat() async{
  final response = await http.get(catUrl, headers: {'Accept':'application/json'});
  var convertiarjson = jsonDecode(response.body);
  // print(convertiarjson);
  return convertiarjson;
}

final pageid = '11366';
final pageUrl = 'https://studio-press.pro/wp-json/wp/v2/pages?=';

Future<List> myPage() async{
  final response = await http.get(pageUrl+pageid, headers: {'Accept':'application/json'});
  var convertiarjson = jsonDecode(response.body);
  print(convertiarjson);
  return convertiarjson;
}


final searchUrl = 'https://studio-press.pro/wp-json/wp/v2/posts?_embed&fields=title,content.rendered&search=';

Future<List> search(query) async{
  final response = await http.get(searchUrl+query, headers: {'Accept':'application/json'});
  var convertiarjson = jsonDecode(response.body);
  // print(convertiarjson);
  return convertiarjson;
}
