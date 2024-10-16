import 'package:flutter/cupertino.dart';

class HeightSpacer extends StatelessWidget{
  double height;
  HeightSpacer({required this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }

}