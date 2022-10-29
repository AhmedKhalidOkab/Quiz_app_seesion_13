import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Answer extends StatelessWidget {
  Answer({super.key, required this.text});
  final Object? text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {}),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: 300,
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text('$text')),
        ),
      ),
    );
  }
}
