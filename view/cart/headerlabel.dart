
import 'package:flutter/material.dart';



class HeaderLabel extends StatelessWidget {
  final kDefaultPadding = 24.0;
  final kLightColor = const Color(0xFF808080);
  final kLessPadding = 10.0;
  final String headerText;
 const HeaderLabel({
    Key? key, required this.headerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(kDefaultPadding),
      child: Text(
        headerText,
        style: TextStyle(color: kLightColor, fontSize: 28.0),
      ),
    );
  }
}
