import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/const/app_colors.dart';
import 'package:newsapp/const/app_string.dart';
import 'package:newsapp/ui/allnews.dart';
import 'package:newsapp/ui/breakingnews.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Exit(context) async => showDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: const Text('Do you want to exit App'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No")),
              const SizedBox(
                width: 30,
              ),
              OutlinedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text("Yes")),
            ],
          ),
        );
      });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Exit(context);
          return Future.value(false);
        },
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: Colors.lightGreenAccent,
              appBar: AppBar(
                title: Text(
                  AppString.appName,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
                backgroundColor: Colors.teal,
                titleSpacing: 0,
                bottom: TabBar(
                  indicatorColor: Colors.black,
                  labelStyle: TextStyle(fontSize: 18.sp),
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

//Drawer-------------->>>
              drawer: Drawer(
                backgroundColor: Colors.teal.shade400,
                child: ListView(
                  children: [
                    DrawerHeader(
                      padding: EdgeInsets.zero,
                      child: Container(
                        color: Colors.teal.shade600,
                        padding: EdgeInsets.fromLTRB(13, 2, 5, 0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/icons/logoapp.png',
                                height: 40,
                              ),
                              SizedBox(height: 10),
                              Text(
                                AppString.drawer_title,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    _CustomListTile("Policy", Icons.policy, () {}),
                    _CustomListTile("Exit", Icons.exit_to_app, () {})
                  ],
                ),
              ),
            )));
  }
}

Widget _CustomListTile(text, icon, ontap) {
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.black,
      size: 25,
    ),
    title: Text(
      text,
      style: TextStyle(fontSize: 15),
    ),
    onTap: ontap,
  );
}
