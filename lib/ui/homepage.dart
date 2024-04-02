import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:newsapp/controllers/exit_controllers.dart';
import 'package:newsapp/ui/allnews.dart';
import 'package:newsapp/ui/breakingnews.dart';
import 'package:newsapp/ui/drawer_item.dart';

import '../utils/app_string.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final exit_controllers = Exit_controllers();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          exit_controllers.Exit(context);
          return Future.value(false);
        },
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
                backgroundColor: Colors.lightGreenAccent,
                appBar: AppBar(
                  title: Text(
                    AppString.appName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  backgroundColor: Colors.teal,
                  centerTitle: true,
                  titleSpacing: 0,
                  bottom: TabBar(
                    indicatorColor: Colors.black,
                    labelStyle: TextStyle(fontSize: 18),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        text: "Breaking News",
                      ),
                      Tab(
                        text: "All News",
                      ),
                    ],
                  ),
                ),
                body: TabBarView(children: [BreakingNews(), AllNews()]),
                drawer: Drawer_Item())));
  }
}
