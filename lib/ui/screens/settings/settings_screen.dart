import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertmdb/ui/widgets/settings_item_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SettingsItemWidget(
          initalIcon: const Icon(Icons.dark_mode_outlined, color: Colors.white),
          upperText: "Theme",
          lowerText: "Dark Mode",
          endingWidget:
              CupertinoSwitch(value: true, onChanged: (bool value) {}),
        ),
        const SettingsItemWidget(
          initalIcon: Icon(Icons.account_circle_outlined, color: Colors.white),
          upperText: "Account",
          lowerText: "Sign out",
          endingWidget: Icon(Icons.clear_outlined, color: Colors.white),
        )
      ],
    );
  }
}
