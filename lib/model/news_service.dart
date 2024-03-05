import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:newsapp/model/news_model.dart';

class News_Service {
  final all_news_url =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=c8235be807d2485da01611abfe978629";
  final breaking_news_url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=c8235be807d2485da01611abfe978629";
//BREAKING NEWS GET--------------------->>>
  Future<List<NewsModel>> getBreakingNews() async {
    var response = await get(Uri.parse(breaking_news_url));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<NewsModel> articles =
          body.map((dynamic item) => NewsModel.fromJson(item)).toList();
      return articles;
    } else {
      throw "Not news found";
    }
  }

  //ALL NEWS GET--------------------->>>
  Future<List<NewsModel>> getAllNews() async {
    var response = await get(Uri.parse(all_news_url));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<NewsModel> articles =
          body.map((dynamic item) => NewsModel.fromJson(item)).toList();
      return articles;
    } else {
      throw "Not news found";
    }
  }
}
