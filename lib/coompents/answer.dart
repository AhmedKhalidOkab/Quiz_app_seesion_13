import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Answer extends StatelessWidget {
  final String text;
  final Color color;
  final Function() answeredTab;
  const Answer(
      {super.key,
      required this.text,
      required this.color,
      required this.answeredTab});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answeredTab,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: 300,
          height: 35,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text('$text')),
        ),
      ),
    );
  }
}
