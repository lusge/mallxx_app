import 'dart:io';

import 'package:flutter/material.dart';

class LoginWithView extends StatelessWidget {
  const LoginWithView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 30,
              height: 30,
              child: Image.asset(
                "assets/icons/google.png",
                // scale: 6,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 30,
              height: 30,
              child: Image.asset(
                "assets/icons/facebook.png",
                // scale: 6,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 30,
              height: 30,
              child: Image.asset(
                "assets/icons/weichat.png",
                // scale: 6,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 30,
              height: 30,
              child: Image.asset(
                "assets/icons/github-fill.png",
                // scale: 6,
              ),
            ),
          ),
          if (Platform.isIOS)
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: 30,
                height: 30,
                child: Image.asset(
                  "assets/icons/ic_apple_round.png",
                  scale: 0.5,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
