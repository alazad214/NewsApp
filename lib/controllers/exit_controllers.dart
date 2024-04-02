import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exit_controllers {
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
}
