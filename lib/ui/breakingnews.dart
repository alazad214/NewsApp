import 'package:flutter/material.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/model/news_service.dart';
import 'package:newsapp/ui/news_itemlist.dart';

class BreakingNews extends StatelessWidget {
  BreakingNews({super.key});

  News_Service news_service = News_Service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: news_service.getBreakingNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<NewsModel> articleModel  = snapshot.data ?? [];
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItemList(newsModel: articleModel [index]);
                },
                itemCount: articleModel .length,
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
