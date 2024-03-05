import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/const/app_colors.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/ui/newsdetails.dart';

class NewsItemList extends StatelessWidget {
  final NewsModel newsModel;
  NewsItemList({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => NewsDetails(newsModel: newsModel)));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        color: AppColors.indigo_c,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  newsModel.publishedAt.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ),
            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              imageUrl: newsModel.urlToImage.toString(),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Container(
                width: double.infinity,
                color: Colors.blue,
                padding: EdgeInsets.all(10),
                child: Text(
                  newsModel.source!.name.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Colors.black, fontSize: 18.sp),
                )),
            Container(
              width: double.infinity,
              color: Colors.grey,
              padding: EdgeInsets.all(10),
              child: Text(
                newsModel.title.toString(),
                style: TextStyle(fontSize: 16.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
