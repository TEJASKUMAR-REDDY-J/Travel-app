import 'package:flutter/material.dart';
import 'package:travel_app/msic/AppColors.dart';
import 'package:travel_app/widgets/appText.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isreponsive;
  final double? width;
  const ResponsiveButton({this.isreponsive = false, this.width=120, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isreponsive==true?double.maxFinite:width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color:AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment:isreponsive==true?MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: isreponsive==true?const AppText(text: "Book Tickets now",color: Color.fromARGB(255, 85, 133, 188),):Container(),
            ),
            Image.asset("img/button-one.png"),
          ],
        ),
      ),
    );
  }
}