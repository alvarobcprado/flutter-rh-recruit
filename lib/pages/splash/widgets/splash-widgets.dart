import 'package:flutter/material.dart';

TextSpan buildAuthorName(String name) {
  return TextSpan(
    text: "\n$name",
    style: TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
  );
}

Widget buildBottomText() {
  return Text.rich(
    TextSpan(
      text: "By",
      style: TextStyle(color: Colors.white, fontSize: 12),
      children: [
        buildAuthorName("Álvaro P"),
        buildAuthorName("Caroline V"),
        buildAuthorName("Marcos G"),
      ],
    ),
    textAlign: TextAlign.center,
  );
}
