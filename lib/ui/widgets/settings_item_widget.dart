import 'package:flutter/material.dart';
import 'package:fluttertmdb/ui/utils/typography.dart';

class SettingsItemWidget extends StatelessWidget {
  final Icon initalIcon;
  final String upperText;
  final String lowerText;
  final Widget endingWidget;

  const SettingsItemWidget(
      {super.key,
      required this.initalIcon,
      required this.upperText,
      required this.lowerText,
      required this.endingWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        width: double.infinity,
        height: 90,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            initalIcon,
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    upperText,
                    style: TypographyTmdb.desc,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    lowerText,
                    style: TypographyTmdb.appbarHeading,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: endingWidget,
            )
          ],
        ));
  }
}
