import 'package:flutter/material.dart';

class Candidate {
  String name;
  String qualification;
  String presentation =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
  int age;
  int id;
  bool presence;
  bool interviewed;
  var signature;
  CircleAvatar avatar;
  int points = 0;
  Color _interviewResult = Colors.green;

  Candidate({
    @required this.name,
    @required this.age,
    @required this.qualification,
    @required this.id,
    @required this.presence,
    this.signature = false,
    this.interviewed = false,
    Widget avatar,
  }) : this.avatar = CircleAvatar(
          child: avatar ?? Icon(Icons.person),
          radius: 25,
        );

  set changePresence(bool newPresence) {
    presence = newPresence;
  }

  set changeInterviewed(bool newInterviewed) {
    interviewed = newInterviewed;
  }

  set signatureImage(var newSignature) {
    signature = newSignature;
  }

  Color get result => _interviewResult;

  void addPoint(int point) {
    //points + point > 3 ? points = 4 : points += point;
    if (points + point > 3) {
      points = 4;
      _interviewResult = Colors.red;
    } else {
      points += point;
    }
  }
}
