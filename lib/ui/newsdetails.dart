import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/const/app_colors.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel newsModel;
  const NewsDetails({super.key, required this.newsModel});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  final Uri _url = Uri.parse('https://flutter.dev');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.teal,
        title: Text(widget.newsModel.title.toString()),
      ),
      body: ListView(
        children: [
          CachedNetworkImage(
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl: widget.newsModel.urlToImage.toString(),
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Text(
              "Source: " + widget.newsModel.source!.name.toString(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: Colors.black, fontSize: 18.sp),
            ),
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5))),
          ),
          Padding(
            padding: EdgeInsets.all(10.h),
            child: Text(
              widget.newsModel.description.toString(),
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  final Uri _url = Uri.parse(widget.newsModel.url.toString());
                  if (!await launchUrl(_url)) {
                    throw Exception('Could not launch $_url');
                  }
                },
                child: Text("Read More...")),
          )
        ],
      ),
    );
  }
}
