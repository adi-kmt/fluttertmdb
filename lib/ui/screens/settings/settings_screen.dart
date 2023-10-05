import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertmdb/ui/widgets/settings_item_widget.dart';
import 'package:fluttertmdb/ui/widgets/simple_alert_dialog.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Color(0xff211F26),
          )),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SettingsItemWidget(
            initalIcon:
                const Icon(Icons.dark_mode_outlined, color: Colors.white),
            upperText: "Theme",
            lowerText: "Dark Mode",
            endingWidget: CupertinoSwitch(
                value: isDark,
                onChanged: (bool value) {
                  setState(() {
                    isDark = !isDark;
                    AdaptiveTheme.of(context).toggleThemeMode();
                  });
                }),
          ),
          InkWell(
            onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => const SimpleAlertDialog(
                      icon: Icon(Icons.clear_outlined),
                      title: "Confirm Sign Out",
                      content: "Are you sure you want to sign out of the app? "
                          "Tap on the Signout button to confirm ",
                    )),
            child: const SettingsItemWidget(
              initalIcon:
                  Icon(Icons.account_circle_outlined, color: Colors.white),
              upperText: "Account",
              lowerText: "Sign out",
              endingWidget: Icon(Icons.clear_outlined, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
