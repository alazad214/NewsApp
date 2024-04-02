import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/ui/allnews.dart';
import 'package:newsapp/ui/breakingnews.dart';

import '../controllers/exit_controllers.dart';
import '../utils/app_string.dart';

class Drawer_Item extends StatelessWidget implements PreferredSizeWidget {
  Drawer_Item({super.key});
  final exit_controllers = Exit_controllers();

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          _CustomListTile("All News", Icons.newspaper, () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AllNews()));
          }),
          _CustomListTile("Breaking News", Icons.newspaper, () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => BreakingNews()));
          }),
          _CustomListTile("Exit", Icons.close, () {
            exit_controllers.Exit(context);
          })
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Widget _CustomListTile(text, icon, ontap) {
  return InkWell(
    child: ListTile(
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
    ),
  );
}
