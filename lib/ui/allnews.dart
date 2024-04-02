import 'package:flutter/material.dart';

import '../model/news_model.dart';
import '../model/news_service.dart';
import 'news_itemlist.dart';

class AllNews extends StatelessWidget {
  AllNews({super.key});

  News_Service news_service = News_Service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: news_service.getAllNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<NewsModel> articleModel = snapshot.data ?? [];
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItemList(newsModel: articleModel[index]);
                },
                itemCount: articleModel.length,
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
