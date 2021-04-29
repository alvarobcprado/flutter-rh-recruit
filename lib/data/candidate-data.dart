import 'package:flutter/material.dart';

class Candidate {
  String name;
  int id;
  bool presence;

  Candidate({
    @required this.name,
    @required this.id,
    this.presence = false,
  });

  set changePresence(bool newPresence) {
    presence = newPresence;
  }
}
